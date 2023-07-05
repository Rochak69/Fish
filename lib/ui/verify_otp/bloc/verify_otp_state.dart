// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class VerifyOtpState {}

class VerifyOtpInitial extends VerifyOtpState {}

class VerifyOtpSuccess extends VerifyOtpState {}

class VerifyOtpFailed extends VerifyOtpState {
  final String errorMessage;
  VerifyOtpFailed({
    required this.errorMessage,
  });
}
