import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fish_shop/common/api_response.dart';
import 'package:fish_shop/ui/pending_request_per_listing/bloc/pending_request_per_listing_event.dart';
import 'package:fish_shop/ui/pending_request_per_listing/bloc/pending_request_per_listing_state.dart';
import 'package:fish_shop/ui/pending_request_per_listing/repository/pending_request_listings_api_client.dart';
import 'package:fish_shop/ui/utils/utils.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class PendingRequestPerListingBloc
    extends Bloc<PendingRequestPerListingEvent, PendingRequestPerListingState> {
  final PendingRequestPerListingApiClient apiClient;
  PendingRequestPerListingBloc(this.apiClient)
      : super(PendingRequestInitial()) {
    on<AcceptBuyerRequest>(acceptRequest);
    on<RejectBuyerRequest>(rejectRequest);
  }

  FutureOr<void> acceptRequest(AcceptBuyerRequest event,
      Emitter<PendingRequestPerListingState> emit) async {
    try {
      emit(PendingRequestInitial());
      final result = await apiClient.acceptRequest(event.id);
      result as ApiResponse;
      displayToastMessage('Successfully accepted');
      emit(PendingRequestSuccess(event.index));
    } catch (e) {
      try {
        ApiErrorResponse apiErrorResponse = e as ApiErrorResponse;
        displayToastMessage(e.details?[0].msg ?? 'Error getting data');
        emit(PendingRequestInitial());
      } catch (e) {
        displayToastMessage(e.toString());
        emit(PendingRequestInitial());
      }
    }
  }

  FutureOr<void> rejectRequest(RejectBuyerRequest event,
      Emitter<PendingRequestPerListingState> emit) async {
    try {
      emit(PendingRequestInitial());
      final result = await apiClient.rejectRequest(event.id);
      result as ApiResponse;
      displayToastMessage('Successfully Rejected');
      emit(PendingRequestSuccess(event.index));
    } catch (e) {
      try {
        ApiErrorResponse apiErrorResponse = e as ApiErrorResponse;
        displayToastMessage(e.details?[0].msg ?? 'Error getting data');
        emit(PendingRequestInitial());
      } catch (e) {
        displayToastMessage(e.toString());
        emit(PendingRequestInitial());
      }
    }
  }
}
