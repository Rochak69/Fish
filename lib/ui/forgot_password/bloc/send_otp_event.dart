abstract class SendOtpEvent {}

class SendOtpEventWithPhone extends SendOtpEvent {
  String phoneNumber;
  SendOtpEventWithPhone({
    required this.phoneNumber,
  });
}
