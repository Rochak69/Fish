// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:buyer_shop/common/api_response.dart';
import 'package:buyer_shop/ui/login/model/login_response.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginSuccess extends LoginState {
  final ApiResponse<LoginResponse> result;

  LoginSuccess({required this.result});
}

class LoginFailed extends LoginState {
  String errorMessage;
  LoginFailed({
    required this.errorMessage,
  });
}
