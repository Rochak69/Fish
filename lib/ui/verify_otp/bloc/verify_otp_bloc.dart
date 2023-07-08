import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:buyer_shop/common/api_response.dart';
import 'package:buyer_shop/ui/verify_otp/bloc/verify_otp_event.dart';
import 'package:buyer_shop/ui/verify_otp/bloc/verify_otp_state.dart';
import 'package:buyer_shop/ui/verify_otp/repository/verify_otp_api_client.dart';
import 'package:injectable/injectable.dart';

@injectable
class VerifyOtpBloc extends Bloc<VerifyOtpEvent, VerifyOtpState> {
  VerifyOtpApiClient apiClient;
  VerifyOtpBloc(this.apiClient) : super(VerifyOtpInitial()) {
    on<VerifyOtpEventWithPhone>(_register);
  }

  FutureOr<void> _register(
      VerifyOtpEventWithPhone event, Emitter<VerifyOtpState> emit) async {
    try {
      final result =
          await apiClient.verifyOtp(otp: event.otp, userId: event.userId);
      ApiResponse reposne = result as ApiResponse;
      emit(VerifyOtpSuccess());
    } catch (e) {
      try {
        ApiErrorResponse apiErrorResponse = e as ApiErrorResponse;
        emit(VerifyOtpFailed(
            errorMessage: e.details?[0].msg ?? 'Error getting data'));
      } catch (e) {
        emit(VerifyOtpFailed(errorMessage: e.toString()));
      }
    }
  }
}
