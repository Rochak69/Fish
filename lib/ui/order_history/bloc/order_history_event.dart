abstract class OrderHistoryEvent {}

class GetOrderHistory extends OrderHistoryEvent {}

class CompleteOfferEvent extends OrderHistoryEvent {
  final String id;

  CompleteOfferEvent(this.id);
}

class RejectOffer extends OrderHistoryEvent {
  final String id;

  RejectOffer(this.id);
}
