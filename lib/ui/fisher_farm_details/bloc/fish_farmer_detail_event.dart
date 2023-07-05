// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class FishFarmerDetailEvent {}

class PostFarmerDetailsEvent extends FishFarmerDetailEvent {
  String userId;
  String? profilePicture;
  String? farmName;
  int? pondSize;
  String? pradesh;
  String? district;
  String? locationKey;
  String? location;
  int? woda;

  PostFarmerDetailsEvent({
    required this.userId,
    this.profilePicture,
    this.farmName,
    this.pondSize,
    this.pradesh,
    this.district,
    this.locationKey,
    this.location,
    this.woda,
  });
}
