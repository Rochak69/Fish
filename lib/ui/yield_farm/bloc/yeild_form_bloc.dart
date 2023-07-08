import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:buyer_shop/common/api_response.dart';
import 'package:buyer_shop/ui/yield_farm/bloc/yeild_form_event.dart';
import 'package:buyer_shop/ui/yield_farm/bloc/yeild_form_state.dart';
import 'package:buyer_shop/ui/yield_farm/model/yeild_form_response.dart';
import 'package:buyer_shop/ui/yield_farm/repository/yeild_form_api_client.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class YeildFormBloc extends Bloc<YeildFormEvent, YeildFormState> {
  final YeildFormApiClient apiClient;
  YeildFormBloc(this.apiClient) : super(YeildFormInitial()) {
    on<PostYeildForm>(_postYeildFrom);
  }

  FutureOr<void> _postYeildFrom(
      PostYeildForm event, Emitter<YeildFormState> emit) async {
    try {
      final result = await apiClient.createBuyerDemand(
          fishType: event.fishType,
          avgFishWeight: event.avgFishWeight,
          totalWeight: event.totalWeight,
          yieldDate: event.deadline);
      ApiResponse<YeildFormResponse> registerResponse =
          result as ApiResponse<YeildFormResponse>;
      emit(YeildFormSuccess());
    } catch (e) {
      try {
        ApiErrorResponse apiErrorResponse = e as ApiErrorResponse;
        emit(YeildFormFailed(
            errorMessage: e.details?[0].msg ?? 'Error getting data'));
      } catch (e) {
        emit(YeildFormFailed(errorMessage: e.toString()));
      }
    }
  }
}
