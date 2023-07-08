import '../../../common/api_response.dart';
import '../model/order_history_response.dart';

abstract class OrderHistoryState {}

class OrderHistoryInitial extends OrderHistoryState {}

class OrderHistorysSuccess extends OrderHistoryState {
  final ApiResponseForList<OrderHistoryResponse> orders;

  OrderHistorysSuccess({required this.orders});
}

class OrderHistoryFailed extends OrderHistoryState {
  final String errorMessage;

  OrderHistoryFailed({required this.errorMessage});
}
