// ignore_for_file: public_member_api_docs, sort_constructors_first

abstract class FishFarmerDetailEvent {}

class PostFarmerDetailsEvent extends FishFarmerDetailEvent {
  String userId;
  String? profilePicture;
  String? registerPic;
  String? identification;
  String farmName;
  String farmersName;
  String phoneNumber;
  double? pondSize;
  String pradesh;
  String district;
  String nagarpalika;

  int woda;
  String? tole;
  String? email;
  String? facebook;

  PostFarmerDetailsEvent({
    required this.userId,
    required this.profilePicture,
    required this.identification,
    required this.registerPic,
    required this.farmName,
    required this.farmersName,
    required this.phoneNumber,
    this.pondSize,
    required this.pradesh,
    required this.district,
    required this.nagarpalika,
    required this.woda,
    this.tole,
    this.email,
    this.facebook,
  });
}

class GetProvince extends FishFarmerDetailEvent {}

class GetDistrict extends FishFarmerDetailEvent {
  final String? provinceId;

  GetDistrict({required this.provinceId});
}

class GetMunicipality extends FishFarmerDetailEvent {
  final String districtId;

  GetMunicipality({required this.districtId});
}

class GetWoda extends FishFarmerDetailEvent {
  final String municipalityId;

  GetWoda({required this.municipalityId});
}
