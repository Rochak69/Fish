abstract class LoginEvent {}

class LoginWithPhone extends LoginEvent {
  String password;

  String phoneNumber;
  LoginWithPhone({
    required this.password,
    required this.phoneNumber,
  });
}
