abstract class RegisterEvent {}

class RegisterEventWithPhone extends RegisterEvent {
  String password;
  String userName;
  String phoneNumber;
  RegisterEventWithPhone({
    required this.password,
    required this.userName,
    required this.phoneNumber,
  });
}
