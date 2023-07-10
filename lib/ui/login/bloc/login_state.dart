// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fish_shop/common/api_response.dart';
import 'package:fish_shop/ui/login/model/login_response.dart';
import 'package:fish_shop/ui/login/model/user_details_response.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginSuccess extends LoginState {
  final ApiResponse<LoginResponse> result;
  final UserDetailsResponse? userDetails;

  LoginSuccess({
    required this.result,
    required this.userDetails,
  });
}

class LoginFailed extends LoginState {
  String errorMessage;
  LoginFailed({
    required this.errorMessage,
  });
}
