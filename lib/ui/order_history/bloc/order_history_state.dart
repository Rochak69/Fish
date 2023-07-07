abstract class OrderHistoryState {}

class OrderHistoryInitial extends OrderHistoryState {}

class OrderHistorysSuccess extends OrderHistoryState {}

class OrderHistoryFailed extends OrderHistoryState {
  final String errorMessage;

  OrderHistoryFailed({required this.errorMessage});
}
