abstract class PendingRequestPerListingState {}

class PendingRequestInitial extends PendingRequestPerListingState {}

class PendingRequestSuccess extends PendingRequestPerListingState {}

class PendingRequestFailed extends PendingRequestPerListingState {
  final String errorMessage;

  PendingRequestFailed({required this.errorMessage});
}
