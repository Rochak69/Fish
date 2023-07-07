// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class PendingRequestPerListingEvent {}

class AcceptBuyerRequest extends PendingRequestPerListingEvent {
  final String id;
  final int index;

  AcceptBuyerRequest({required this.id, required this.index});
}

class RejectBuyerRequest extends PendingRequestPerListingEvent {
  final String id;
  final int index;

  RejectBuyerRequest({
    required this.id,
    required this.index,
  });
}
