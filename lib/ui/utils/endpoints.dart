class Endpoints {
  static const String baseUrl = 'http://64.227.154.34:8080/api';
  static const String loginUrl = '/user/login';
  static const String registerUrl = '/user/register';
  static const String otpUrl = '/user/get-otp';
  static const String verifyOtp = '/user/verify-code';
  static const String resetPassword = '/user/reset-password';
  static const String fishFarmerDetails = '/farmer/request';
  static const String createRequestToBuyer = '/farmerRequest';
  static const String getAllFarmersSupply = '/farmerSupply';
  static const String getMyListings = '/me/listing?type=farmer';
  // static String yourListings(String farmerId) => '/farmerSupply/$farmerId';
  static String deleteMyListing(String id) => '/farmerSupply/$id';
  static String acceptBuyerRequest(String id) => '/buyerRequest/$id';
  static String rejectBuyerRequest(String id) => '/buyerRequest/$id';
  static const String createFarmersSupply = '/farmerSupply';
  static const String getAllBuyerDemand = '/buyerDemand';
  static const String getUserDetails = '/me?type=farmer';
  static const String getAllBuyerRequest = '/buyer/request';
  String getSpecificFarmerSupply(String supplyId) {
    return '/farmerSupply/$supplyId';
  }

  static const String province = '/location/province';
  static String getDistrict(String provinceId) =>
      '/location/district/$provinceId';
  static String getMunicipality(String districtId) =>
      '/location/municipality/$districtId';
  static String woda(String municipalityId) => '/location/woda/$municipalityId';
}
