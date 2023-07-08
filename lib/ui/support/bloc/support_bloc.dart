// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fish_shop/res/colors.dart';

import 'package:fish_shop/ui/support/bloc/support_event.dart';
import 'package:fish_shop/ui/support/bloc/support_state.dart';
import 'package:fish_shop/ui/support/repository/support_api_client.dart';
import 'package:fish_shop/ui/utils/utils.dart';
import 'package:injectable/injectable.dart';

import '../../../common/api_response.dart';

@injectable
class SupportBloc extends Bloc<SupportEvent, SupportState> {
  SupportApiClient apiClient;
  SupportBloc(
    this.apiClient,
  ) : super(SupportInitial()) {
    on<CreateIssue>(_createIssue);
  }

  FutureOr<void> _createIssue(
      CreateIssue event, Emitter<SupportState> emit) async {
    try {
      final result = await apiClient.support(issue: event.issue);
      ApiResponse resposne = result as ApiResponse;
      emit(SupportSucess());
      displayToastMessage('Issue sent successfully');
    } catch (e) {
      try {
        ApiErrorResponse apiErrorResponse = e as ApiErrorResponse;
        displayToastMessage(e.details?[0].msg ?? 'Error getting data',
            backgroundColor: AppColors.textRedColor);
      } catch (e) {
        displayToastMessage(e.toString(),
            backgroundColor: AppColors.textRedColor);
      }
    }
  }
}
