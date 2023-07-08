import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:buyer_shop/common/api_response.dart';
import 'package:buyer_shop/ui/fisher_farm_details/bloc/fish_farmer_detail_event.dart';
import 'package:buyer_shop/ui/fisher_farm_details/bloc/fish_farmer_detail_state.dart';
import 'package:buyer_shop/ui/fisher_farm_details/model/district_response.dart';
import 'package:buyer_shop/ui/fisher_farm_details/model/municipality_response.dart';
import 'package:buyer_shop/ui/fisher_farm_details/model/woda_response.dart';
import 'package:buyer_shop/ui/fisher_farm_details/repository/fish_farmer_detail_api_client.dart';
import 'package:injectable/injectable.dart';

@injectable
class FishFarmerDetailBloc
    extends Bloc<FishFarmerDetailEvent, FishFarmerDetailState> {
  FishFarmerDetailApiClient apiClient;
  FishFarmerDetailBloc(this.apiClient) : super(const FishFarmerDetailState()) {
    on<PostFarmerDetailsEvent>(_postDetails);
    on<GetProvince>(_getProvince);
    on<GetDistrict>(_getDistrict);
    on<GetMunicipality>(_getMunicipality);
    on<GetWoda>(_getWoda);
  }

  FutureOr<void> _postDetails(
      PostFarmerDetailsEvent event, Emitter<FishFarmerDetailState> emit) async {
    try {
      final result = await apiClient.postdetails(
          userId: event.userId,
          district: event.district,
          farmName: event.farmName,
          pradesh: event.pradesh,
          pondSize: event.pondSize,
          profilePicture: event.profilePicture,
          woda: event.woda,
          municiplaity: event.nagarpalika);
      result as ApiResponse;
      emit(state.copyWith(theStates: TheStates.success, isPosted: true));
    } catch (e) {
      try {
        e as ApiErrorResponse;
        emit(state.copyWith(
            theStates: TheStates.failed,
            errorMessage: e.details?[0].msg ?? 'Error getting data'));
      } catch (e) {
        emit(state.copyWith(
            theStates: TheStates.failed, errorMessage: e.toString()));
      }
    }
  }

  FutureOr<void> _getProvince(
      GetProvince event, Emitter<FishFarmerDetailState> emit) async {
    try {
      final result = await apiClient.getProvince();

      emit(state.copyWith(
          theStates: TheStates.success, provinceResponse: result.data));
    } catch (e) {
      try {
        e as ApiErrorResponse;
        emit(state.copyWith(
            theStates: TheStates.failed,
            errorMessage: e.details?[0].msg ?? 'Error getting data'));
      } catch (e) {
        emit(state.copyWith(
            theStates: TheStates.failed, errorMessage: e.toString()));
      }
    }
  }

  FutureOr<void> _getDistrict(
      GetDistrict event, Emitter<FishFarmerDetailState> emit) async {
    try {
      final result = await apiClient.getDistrict(provinceId: event.provinceId)
          as ApiResponseForList<DistrictResponse>;

      emit(state.copyWith(
          theStates: TheStates.success, districtResponse: result.data));
    } catch (e) {
      try {
        e as ApiErrorResponse;
        emit(state.copyWith(
            theStates: TheStates.failed,
            errorMessage: e.details?[0].msg ?? 'Error getting data'));
      } catch (e) {
        emit(state.copyWith(
            theStates: TheStates.failed, errorMessage: e.toString()));
      }
    }
  }

  FutureOr<void> _getMunicipality(
      GetMunicipality event, Emitter<FishFarmerDetailState> emit) async {
    try {
      final result =
          await apiClient.getMunicipality(districtId: event.districtId)
              as ApiResponseForList<MunicipalityResponse>;

      emit(state.copyWith(
          theStates: TheStates.success, municipalityResponse: result.data));
    } catch (e) {
      try {
        e as ApiErrorResponse;
        emit(state.copyWith(
            theStates: TheStates.failed,
            errorMessage: e.details?[0].msg ?? 'Error getting data'));
      } catch (e) {
        emit(state.copyWith(
            theStates: TheStates.failed, errorMessage: e.toString()));
      }
    }
  }

  FutureOr<void> _getWoda(
      GetWoda event, Emitter<FishFarmerDetailState> emit) async {
    try {
      final result =
          await apiClient.getWoda(municipalityId: event.municipalityId)
              as ApiResponseForList<WodaResponse>;

      emit(state.copyWith(
          theStates: TheStates.success, wodaResponse: result.data));
    } catch (e) {
      try {
        e as ApiErrorResponse;
        emit(state.copyWith(
            theStates: TheStates.failed,
            errorMessage: e.details?[0].msg ?? 'Error getting data'));
      } catch (e) {
        emit(state.copyWith(
            theStates: TheStates.failed, errorMessage: e.toString()));
      }
    }
  }
}
