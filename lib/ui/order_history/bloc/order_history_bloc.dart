// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:injectable/injectable.dart';

import '../../../common/api_response.dart';
import '../../../res/colors.dart';
import '../../utils/utils.dart';
import '../model/order_history_response.dart';
import '../repository/order_history_api_client.dart';
import 'order_history_event.dart';
import 'order_history_state.dart';

@lazySingleton
class OrderHistoryBloc extends Bloc<OrderHistoryEvent, OrderHistoryState> {
  final OrderHistoryApiClient apiClient;
  OrderHistoryBloc(
    this.apiClient,
  ) : super(OrderHistoryInitial()) {
    on<GetOrderHistory>(_getOrderHistory);
    on<CompleteOfferEvent>(_completeOrder);
    on<RejectOffer>(_rejectOffer);
  }

  FutureOr<void> _getOrderHistory(
      GetOrderHistory event, Emitter<OrderHistoryState> emit) async {
    try {
      final result = await apiClient.getOrderhistory()
          as ApiResponseForList<OrderHistoryResponse>;

      emit(OrderHistorysSuccess(orders: result));
    } catch (e) {
      try {
        ApiErrorResponse apiErrorResponse = e as ApiErrorResponse;
        emit(OrderHistoryFailed(
            errorMessage: e.details?[0].msg ?? 'Error getting data'));
      } catch (e) {
        emit(OrderHistoryFailed(errorMessage: e.toString()));
      }
    }
  }

  FutureOr<void> _completeOrder(
      CompleteOfferEvent event, Emitter<OrderHistoryState> emit) async {
    try {
      final result = await apiClient.completeOrder(event.id);
      displayToastMessage('Sucess');
      add(GetOrderHistory());
    } catch (e) {
      try {
        ApiErrorResponse apiErrorResponse = e as ApiErrorResponse;
        displayToastMessage(e.details?[0].msg ?? 'Error getting data',
            backgroundColor: AppColors.textRedColor);
      } catch (e) {
        displayToastMessage('Error', backgroundColor: AppColors.textRedColor);
      }
    }
  }

  FutureOr<void> _rejectOffer(
      RejectOffer event, Emitter<OrderHistoryState> emit) async {
    try {
      final result = await apiClient.rejectOrder(event.id);

      displayToastMessage('Sucess');
      add(GetOrderHistory());
    } catch (e) {
      try {
        ApiErrorResponse apiErrorResponse = e as ApiErrorResponse;
        displayToastMessage(e.details?[0].msg ?? 'Error getting data',
            backgroundColor: AppColors.textRedColor);
      } catch (e) {
        displayToastMessage('Error', backgroundColor: AppColors.textRedColor);
      }
    }
  }
}
