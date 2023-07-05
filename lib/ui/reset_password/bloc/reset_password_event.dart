// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class ResetPasswordEvent {}

class ResetPasswordEventWithPhone extends ResetPasswordEvent {
  String password;
  String userId;
  ResetPasswordEventWithPhone({
    required this.password,
    required this.userId,
  });
}
