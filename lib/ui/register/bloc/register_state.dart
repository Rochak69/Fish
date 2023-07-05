// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterSuccess extends RegisterState {}

class RegisterFailed extends RegisterState {
  String errorMessage;
  RegisterFailed({
    required this.errorMessage,
  });
}
