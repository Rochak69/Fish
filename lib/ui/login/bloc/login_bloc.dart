import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:buyer_shop/common/api_response.dart';
import 'package:buyer_shop/ui/login/bloc/login_event.dart';
import 'package:buyer_shop/ui/login/bloc/login_state.dart';
import 'package:buyer_shop/ui/login/model/login_response.dart';
import 'package:buyer_shop/ui/login/repository/login_api_client.dart';
import 'package:buyer_shop/ui/utils/preferences.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginApiClient apiClient;
  LoginBloc(this.apiClient) : super(LoginInitial()) {
    on<LoginWithPhone>(_login);
  }

  FutureOr<void> _login(LoginWithPhone event, Emitter<LoginState> emit) async {
    try {
      final result = await apiClient.login(
        phoneNumber: event.phoneNumber,
        password: event.password,
      ) as ApiResponse<LoginResponse>;
      Preferences preferences = Preferences();
      await preferences.saveString(
          Preference.accessToken, result.data?.sessionToken ?? '');
      await preferences.saveString(
          Preference.phoneNumber, result.data?.phoneNumber ?? '');
      emit(LoginSuccess(result: result));
    } catch (e) {
      try {
        ApiErrorResponse apiErrorResponse = e as ApiErrorResponse;
        emit(LoginFailed(
            errorMessage: e.details?[0].msg ?? 'Error getting data'));
      } catch (e) {
        emit(LoginFailed(errorMessage: 'Login Failed'));
      }
    }
  }
}
