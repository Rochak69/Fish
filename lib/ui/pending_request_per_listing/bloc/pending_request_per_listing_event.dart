// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

abstract class PendingRequestPerListingEvent {}

class AcceptBuyerRequest extends PendingRequestPerListingEvent {
  final String id;
  final BuildContext context;
  final int index;

  AcceptBuyerRequest(this.context, {required this.id, required this.index});
}

class RejectBuyerRequest extends PendingRequestPerListingEvent {
  final String id;
  final BuildContext context;
  final int index;

  RejectBuyerRequest(
    this.context, {
    required this.id,
    required this.index,
  });
}
