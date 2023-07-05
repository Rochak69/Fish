// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class VerifyOtpEvent {}

class VerifyOtpEventWithPhone extends VerifyOtpEvent {
  String otp;
  String userId;

  VerifyOtpEventWithPhone({
    required this.otp,
    required this.userId,
  });
}
