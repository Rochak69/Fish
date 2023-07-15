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
  String citizenName;
  String citizenDistricId;
  String citizenNumber;
  String? citizenshipPhoto;

  int woda;
  String? tole;
  String? email;
  String? facebook;
  bool isEdit;
  PostFarmerDetailsEvent({
    required this.userId,
    required this.profilePicture,
    required this.registerPic,
    required this.identification,
    required this.farmName,
    required this.farmersName,
    required this.phoneNumber,
    this.pondSize,
    required this.pradesh,
    required this.district,
    required this.nagarpalika,
    required this.citizenName,
    required this.citizenDistricId,
    required this.citizenNumber,
    required this.citizenshipPhoto,
    required this.woda,
    this.tole,
    this.email,
    this.facebook,
    required this.isEdit,
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
