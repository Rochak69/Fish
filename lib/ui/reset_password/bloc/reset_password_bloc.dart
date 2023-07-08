import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:buyer_shop/common/api_response.dart';
import 'package:buyer_shop/ui/reset_password/bloc/reset_password_event.dart';
import 'package:buyer_shop/ui/reset_password/bloc/reset_password_state.dart';
import 'package:buyer_shop/ui/reset_password/repository/reset_password_api_client.dart';
import 'package:injectable/injectable.dart';

@injectable
class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  ResetPasswordApiClient apiClient;
  ResetPasswordBloc(this.apiClient) : super(ResetPasswordInitial()) {
    on<ResetPasswordEventWithPhone>(_resetPassword);
  }

  FutureOr<void> _resetPassword(ResetPasswordEventWithPhone event,
      Emitter<ResetPasswordState> emit) async {
    try {
      final result = await apiClient.resetPassword(
          password: event.password, userId: event.userId);
      ApiResponse resposne = result as ApiResponse;
      emit(ResetPasswordSuccess());
    } catch (e) {
      try {
        ApiErrorResponse apiErrorResponse = e as ApiErrorResponse;
        emit(ResetPasswordFailed(
            errorMessage: e.details?[0].msg ?? 'Error getting data'));
      } catch (e) {
        emit(ResetPasswordFailed(
            errorMessage: 'Unsuccessful reseting password'));
      }
    }
  }
}
