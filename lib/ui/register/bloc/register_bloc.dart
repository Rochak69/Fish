import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fish_shop/common/api_response.dart';
import 'package:fish_shop/ui/register/bloc/register_event.dart';
import 'package:fish_shop/ui/register/bloc/register_state.dart';
import 'package:fish_shop/ui/register/repository/register_api_client.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterApiClient apiClient;
  RegisterBloc(this.apiClient) : super(RegisterInitial()) {
    on<RegisterEventWithPhone>(_register);
  }

  FutureOr<void> _register(
      RegisterEventWithPhone event, Emitter<RegisterState> emit) async {
    try {
      final result = await apiClient.register(
          phoneNumber: event.phoneNumber,
          password: event.password,
          userName: event.userName);

      emit(RegisterSuccess());
    } catch (e) {
      try {
        ApiErrorResponse apiErrorResponse = e as ApiErrorResponse;
        emit(RegisterFailed(
            errorMessage: e.details?[0].msg ?? 'Error getting data'));
      } catch (e) {
        emit(RegisterFailed(errorMessage: 'Registration unsuccesful'));
      }
    }
  }
}
