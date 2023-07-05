import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fish_shop/common/api_response.dart';
import 'package:fish_shop/ui/fisher_farm_details/bloc/fish_farmer_detail_event.dart';
import 'package:fish_shop/ui/fisher_farm_details/bloc/fish_farmer_detail_state.dart';
import 'package:fish_shop/ui/fisher_farm_details/repository/fish_farmer_detail_api_client.dart';
import 'package:injectable/injectable.dart';

@injectable
class FishFarmerDetailBloc
    extends Bloc<FishFarmerDetailEvent, FishFarmerDetailState> {
  FishFarmerDetailApiClient apiClient;
  FishFarmerDetailBloc(this.apiClient) : super(FishFarmerDetailInitial()) {
    on<PostFarmerDetailsEvent>(_postDetails);
  }

  FutureOr<void> _postDetails(
      PostFarmerDetailsEvent event, Emitter<FishFarmerDetailState> emit) async {
    try {
      final result = await apiClient.postdetails(
          userId: event.userId,
          district: event.district,
          farmName: event.farmName,
          location: event.location,
          pondSize: event.pondSize,
          pradesh: event.pradesh,
          profilePicture: event.profilePicture,
          locationKey: event.locationKey!,
          woda: event.woda);
      result as ApiResponse;
      emit(FishFarmerDetailSuccess());
    } catch (e) {
      try {
        e as ApiErrorResponse;
        emit(FishFarmerDetailFailed(
            errorMessage: e.details?[0].msg ?? 'Error getting data'));
      } catch (e) {
        emit(FishFarmerDetailFailed(errorMessage: e.toString()));
      }
    }
  }
}
