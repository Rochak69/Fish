import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fish_shop/common/api_response.dart';
import 'package:fish_shop/ui/pending%20request%20per%20listing/bloc/pending_request_per_listing_event.dart';
import 'package:fish_shop/ui/pending%20request%20per%20listing/bloc/pending_request_per_listing_state.dart';
import 'package:fish_shop/ui/pending%20request%20per%20listing/repository/pending_request_listings_api_client.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class PendingRequestPerListingBloc
    extends Bloc<PendingRequestPerListingEvent, PendingRequestPerListingState> {
  final PendingRequestPerListingApiClient apiClient;
  PendingRequestPerListingBloc(this.apiClient)
      : super(PendingRequestInitial()) {
    on<GetPendingRequestPerListing>(_getPendingRequestPerListing);
  }

  FutureOr<void> _getPendingRequestPerListing(
      PendingRequestPerListingEvent event,
      Emitter<PendingRequestPerListingState> emit) async {
    try {
      final result = await apiClient.getPendingRequestPerListing();
      result as ApiResponse;
      emit(PendingRequestSuccess());
    } catch (e) {
      try {
        ApiErrorResponse apiErrorResponse = e as ApiErrorResponse;
        emit(PendingRequestFailed(
            errorMessage: e.details?[0].msg ?? 'Error getting data'));
      } catch (e) {
        emit(PendingRequestFailed(errorMessage: e.toString()));
      }
    }
  }
}
