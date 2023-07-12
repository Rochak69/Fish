// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fish_shop/ui/contact/model/contact_response.dart';

abstract class ContactState {}

class ContactInitial extends ContactState {}

class ContactFailed extends ContactState {
  final String errorMessage;

  ContactFailed({required this.errorMessage});
}

class ContactSuccess extends ContactState {
  final ContactResponse? contact;

  ContactSuccess({required this.contact});
}
