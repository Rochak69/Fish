abstract class PendingRequestPerListingState {}

class PendingRequestInitial extends PendingRequestPerListingState {}

class PendingRequestSuccess extends PendingRequestPerListingState {
  final int index;

  PendingRequestSuccess(
    this.index,
  );
}

class PendingRequestFailed extends PendingRequestPerListingState {
  final String errorMessage;

  PendingRequestFailed({required this.errorMessage});
}
