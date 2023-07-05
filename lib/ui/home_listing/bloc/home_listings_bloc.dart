// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fish_shop/common/api_response.dart';
import 'package:fish_shop/res/colors.dart';

import 'package:fish_shop/ui/home_listing/bloc/home_listings_event.dart';
import 'package:fish_shop/ui/home_listing/bloc/home_listings_state.dart';
import 'package:fish_shop/ui/home_listing/model/home_listings_response.dart';
import 'package:fish_shop/ui/home_listing/repository/home_listings_api_client.dart';
import 'package:fish_shop/ui/utils/utils.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class HomeListingsBloc extends Bloc<HomeListingsEvent, HomeListingsState> {
  HomeListingApiClient apiClient;
  HomeListingsBloc(
    this.apiClient,
  ) : super(HomeListingsInitial()) {
    on<HomeListingsEvent>(_getAllHomeListings);
    on<SendOffer>(_sendOffer);
  }

  FutureOr<void> _getAllHomeListings(
      HomeListingsEvent event, Emitter<HomeListingsState> emit) async {
    try {
      final userDetails = await apiClient.getUserDetails();

      final result = await apiClient.getHomeListings();
      final response = result as ApiResponseForList<HomeListingsResponse>;

      emit(HomeListingsSuccess(result: response));
    } catch (e) {
      try {
        ApiErrorResponse apiErrorResponse = e as ApiErrorResponse;
        emit(HomeListingsFailed(
            errorMessage: e.details?[0].msg ?? 'Error getting data'));
      } catch (e) {
        emit(HomeListingsFailed(errorMessage: e.toString()));
      }
    }
  }

  FutureOr<void> _sendOffer(
      SendOffer event, Emitter<HomeListingsState> emit) async {
    try {
      final result = await apiClient.sendOffer(
          buyerDemandID: event.userDemandId,
          phoneNumber: event.phoneNumber,
          supplyWeight: event.weight);
      final response = result as ApiResponse;
      displayToastMessage('Offer successfully sent');
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
