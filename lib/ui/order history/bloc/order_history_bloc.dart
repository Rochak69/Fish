// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fish_shop/common/api_response.dart';
import 'package:injectable/injectable.dart';

import 'package:fish_shop/ui/order%20history/bloc/order_history_event.dart';
import 'package:fish_shop/ui/order%20history/bloc/order_history_state.dart';
import 'package:fish_shop/ui/order%20history/repository/order_history_api_client.dart';

@lazySingleton
class OrderHistoryBloc extends Bloc<OrderHistoryEvent, OrderHistoryState> {
  final OrderHistoryApiClient apiClient;
  OrderHistoryBloc(
    this.apiClient,
  ) : super(OrderHistoryInitial()) {
    on<OrderHistoryEvent>(_getOrderHistory);
  }

  FutureOr<void> _getOrderHistory(
      OrderHistoryEvent event, Emitter<OrderHistoryState> emit) async {
    try {
      final result = await apiClient.getOrderhistory();
      result as ApiResponse;
      emit(OrderHistorysSuccess());
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
}
