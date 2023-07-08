import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:buyer_shop/common/api_response.dart';
import 'package:buyer_shop/ui/forgot_password/bloc/send_otp_event.dart';
import 'package:buyer_shop/ui/forgot_password/bloc/send_otp_state.dart';
import 'package:buyer_shop/ui/forgot_password/model/send_otp_response.dart';
import 'package:buyer_shop/ui/forgot_password/repository/send_otp_api_client.dart';

import 'package:injectable/injectable.dart';

@Injectable()
class SendOtpBloc extends Bloc<SendOtpEvent, SendOtpState> {
  SendOtpApiClient apiClient;
  SendOtpBloc(this.apiClient) : super(SendOtpInitial()) {
    on<SendOtpEventWithPhone>(_register);
  }

  FutureOr<void> _register(
      SendOtpEventWithPhone event, Emitter<SendOtpState> emit) async {
    try {
      final result = await apiClient.sendOtp(phoneNumber: event.phoneNumber)
          as ApiResponse<SendOtpResponse>;
      emit(SendOtpSuccess(response: result.data));
    } catch (e) {
      try {
        ApiErrorResponse apiErrorResponse = e as ApiErrorResponse;
        emit(SendOtpFailed(
            errorMessage: e.details?[0].msg ?? 'Error getting data'));
      } catch (e) {
        emit(SendOtpFailed(errorMessage: e.toString()));
      }
    }
  }
}
