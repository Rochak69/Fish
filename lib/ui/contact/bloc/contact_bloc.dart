import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fish_shop/common/api_response.dart';
import 'package:fish_shop/ui/Contact/bloc/contact_event.dart';
import 'package:fish_shop/ui/contact/bloc/contact_state.dart';
import 'package:fish_shop/ui/contact/repository/contact_api_client.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class ContactBloc extends Bloc<ContactEvent, ContactState> {
  ContactApiClient apiClient;
  ContactBloc(this.apiClient) : super(ContactInitial()) {
    on<GetContact>(_Contact);
  }

  FutureOr<void> _Contact(GetContact event, Emitter<ContactState> emit) async {
    try {
      emit(ContactInitial());
      final result = await apiClient.getContact();

      emit(ContactSuccess(contact: result?.data));
    } catch (e) {
      try {
        ApiErrorResponse apiErrorResponse = e as ApiErrorResponse;
        emit(ContactFailed(
            errorMessage: e.details?[0].msg ?? 'Error getting data'));
      } catch (e) {
        emit(ContactFailed(errorMessage: 'Unsuccesful'));
      }
    }
  }
}
