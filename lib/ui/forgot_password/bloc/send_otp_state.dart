import 'package:buyer_shop/ui/forgot_password/model/send_otp_response.dart';

abstract class SendOtpState {}

class SendOtpInitial extends SendOtpState {}

class SendOtpSuccess extends SendOtpState {
  final SendOtpResponse? response;

  SendOtpSuccess({required this.response});
}

class SendOtpFailed extends SendOtpState {
  final String errorMessage;

  SendOtpFailed({required this.errorMessage});
}
