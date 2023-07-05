abstract class HomeListingsEvent {}

class GetHomeListings extends HomeListingsEvent {}

class SendOffer extends HomeListingsEvent {
  String userDemandId;
  String phoneNumber;
  int weight;
  SendOffer({
    required this.userDemandId,
    required this.phoneNumber,
    required this.weight,
  });
}
