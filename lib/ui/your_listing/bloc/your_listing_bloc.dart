import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:buyer_shop/res/colors.dart';
import 'package:buyer_shop/ui/utils/utils.dart';
import 'package:buyer_shop/ui/your_listing/bloc/your_listing_event.dart';
import 'package:buyer_shop/ui/your_listing/bloc/your_listing_state.dart';
import 'package:buyer_shop/ui/your_listing/model/your_listing_model.dart';
import 'package:buyer_shop/ui/your_listing/repository/your_listing_api_client.dart';
import 'package:injectable/injectable.dart';

import '../../../common/api_response.dart';

@lazySingleton
class YourListingBloc extends Bloc<YourListingEvent, YourListingState> {
  final YourListingApiClient apiClient;
  YourListingBloc(this.apiClient) : super(YourListingInitial()) {
    on<GetMyListings>(_getMyListings);
    on<DeleteMyListings>(_deleteMyListing);
  }

  FutureOr<void> _getMyListings(
      GetMyListings event, Emitter<YourListingState> emit) async {
    try {
      emit(YourListingInitial());
      final result = await apiClient.getMylistings();
      final response = result as ApiResponseForList<YourListingsResponse>;
      emit(YourListingSuccess(response));
    } catch (e) {
      try {
        ApiErrorResponse apiErrorResponse = e as ApiErrorResponse;
        emit(YourListingFailed(
            errorMessage: e.details?[0].msg ?? 'Error getting data'));
      } catch (e) {
        emit(YourListingFailed(errorMessage: e.toString()));
      }
    }
  }

  FutureOr<void> _deleteMyListing(
      DeleteMyListings event, Emitter<YourListingState> emit) async {
    try {
      final result = await apiClient.deleteMyListing(id: event.id);
      final response = result as ApiResponse;
      add(GetMyListings());
    } catch (e) {
      try {
        ApiErrorResponse apiErrorResponse = e as ApiErrorResponse;
        displayToastMessage(e.details?[0].msg ?? 'Error getting data',
            backgroundColor: AppColors.textRedColor);
      } catch (e) {
        displayToastMessage(e.toString(),
            backgroundColor: AppColors.textRedColor);
      }
    }
  }
}
