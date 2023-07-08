import 'package:buyer_shop/common/api_response.dart';
import 'package:buyer_shop/common/status.dart';
import 'package:buyer_shop/providers/api_client.dart';
import 'package:buyer_shop/ui/fisher_farm_details/model/district_response.dart';
import 'package:buyer_shop/ui/fisher_farm_details/model/municipality_response.dart';
import 'package:buyer_shop/ui/fisher_farm_details/model/province_response.dart';
import 'package:buyer_shop/ui/fisher_farm_details/model/woda_response.dart';
import 'package:buyer_shop/ui/utils/endpoints.dart';
import 'package:buyer_shop/ui/utils/preferences.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@singleton
class FishFarmerDetailApiClient {
  ApiClient? _apiClient;

  FishFarmerDetailApiClient(ApiClient apiClient) {
    _apiClient = apiClient;
  }

  Future<ApiResponse?> postdetails({
    required String userId,
    required String identification,
    required String profilePic,
    required String registerPic,
    required String organizationName,
    int? pondSize,
    String? pradesh,
    String? district,
    String? municiplaity,
    String? gaupalika,
    int? woda,
  }) async {
    Preferences preferences = Preferences();

    ///or pass object directly to the http post

    FormData formData;
    formData = FormData.fromMap({
      "userId": userId,
      "provinceId": pradesh,
      "districtId": district,
      "wardId": woda.toString(),
      "buisnessName": organizationName,
      "municipalityId": municiplaity,
      "profilePicture": await MultipartFile.fromFile(identification),
      "identificationImage": await MultipartFile.fromFile(profilePic),
      "registrationImage": await MultipartFile.fromFile(registerPic),
    });
    var apiResponse =
        await _apiClient?.httpPost(Endpoints.buyerRequest, formData);

    ///converting to response
    var response = ApiResponse(
        status: Status.success, message: 'Success fully logged in', data: null);

    return response;
  }

  Future<ApiResponseForList<ProvincesResponse>> getProvince() async {
    var apiResponse = await _apiClient?.httpGet(
      Endpoints.province,
    );

    ///converting to response
    var response = ApiResponseForList(
      status: Status.success,
      message: 'Success fully logged in',
      data: (apiResponse as List<dynamic>)
          .map((data) => ProvincesResponse.fromJson(data))
          .toList(),
    );

    return response;
  }

  Future<ApiResponseForList> getDistrict({required String provinceId}) async {
    var apiResponse = await _apiClient?.httpGet(
      Endpoints.getDistrict(provinceId),
    );

    ///converting to response
    var response = ApiResponseForList(
      status: Status.success,
      message: 'Success fully logged in',
      data: (apiResponse as List<dynamic>)
          .map((data) => DistrictResponse.fromJson(data))
          .toList(),
    );

    return response;
  }

  Future<ApiResponseForList> getMunicipality(
      {required String districtId}) async {
    var apiResponse = await _apiClient?.httpGet(
      Endpoints.getMunicipality(districtId),
    );

    ///converting to response
    var response = ApiResponseForList(
      status: Status.success,
      message: 'Success fully logged in',
      data: (apiResponse as List<dynamic>)
          .map((data) => MunicipalityResponse.fromJson(data))
          .toList(),
    );

    return response;
  }

  Future<ApiResponseForList> getWoda({required String municipalityId}) async {
    var apiResponse = await _apiClient?.httpGet(
      Endpoints.woda(municipalityId),
    );

    ///converting to response
    var response = ApiResponseForList(
      status: Status.success,
      message: 'Success fully logged in',
      data: (apiResponse as List<dynamic>)
          .map((data) => WodaResponse.fromJson(data))
          .toList(),
    );

    return response;
  }
}
