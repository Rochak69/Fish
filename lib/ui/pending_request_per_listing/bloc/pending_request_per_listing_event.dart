// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class PendingRequestPerListingEvent {}

class AcceptFarmerRequest extends PendingRequestPerListingEvent {
  final String id;
  final int index;

  AcceptFarmerRequest({required this.id, required this.index});
}

class RejectFarmerRequest extends PendingRequestPerListingEvent {
  final String id;
  final int index;

  RejectFarmerRequest({
    required this.id,
    required this.index,
  });
}
