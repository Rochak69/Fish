import 'package:fish_shop/common/api_response.dart';
import 'package:fish_shop/common/status.dart';
import 'package:fish_shop/providers/api_client.dart';
import 'package:fish_shop/ui/home_listing/model/fish_response.dart';
import 'package:fish_shop/ui/home_listing/model/home_listings_response.dart';
import 'package:fish_shop/ui/login/model/user_details_response.dart';
import 'package:fish_shop/ui/utils/endpoints.dart';
import 'package:fish_shop/ui/utils/preferences.dart';
import 'package:injectable/injectable.dart';

@singleton
class HomeListingApiClient {
  ApiClient? _apiClient;

  HomeListingApiClient(ApiClient apiClient) {
    _apiClient = apiClient;
  }

  Future<ApiResponseForList?> getHomeListings() async {
    Preferences preferences = Preferences();

    ///or pass object directly to the http post

    var apiResponse = await _apiClient?.httpGet(Endpoints.getAllBuyerDemand);

    ///converting to response
    var response = ApiResponseForList(
      status: Status.success,
      message: 'Successfully got',
      data: (apiResponse as List<dynamic>)
          .map((data) => HomeListingsResponse.fromJson(data))
          .toList(),
    );

    return response;
  }

  Future<ApiResponseForList?> getFish() async {
    Preferences preferences = Preferences();

    ///or pass object directly to the http post

    var apiResponse = await _apiClient?.httpGet(Endpoints.fishType);

    ///converting to response
    var response = ApiResponseForList(
      status: Status.success,
      message: 'Successfully got',
      data: (apiResponse as List<dynamic>)
          .map((data) => FishResponse.fromJson(data))
          .toList(),
    );

    return response;
  }

  Future<ApiResponse?> sendOffer(
      {required String buyerDemandID,
      required String phoneNumber,
      required int supplyWeight}) async {
    Preferences preferences = Preferences();
    String? farmerId = await preferences.getString(Preference.farmerId);
    if (farmerId == null) {
      throw Exception();
    }
    Map<String, dynamic> data = {
      "buyerDemandId": buyerDemandID,
      "phoneNumber": phoneNumber,
      "farmerId": farmerId,
      "supplyWeight": supplyWeight
    };

    var apiResponse =
        await _apiClient?.httpPost(Endpoints.createRequestToBuyer, data);

    ///converting to response
    var response = ApiResponse(
        status: Status.success, message: 'Successfully got', data: null);

    return response;
  }

  Future<ApiResponse<UserDetailsResponse>> getUserDetails() async {
    Preferences preferences = Preferences();

    String? token = await preferences.getString(Preference.accessToken);

    var apiResponse =
        await _apiClient?.httpGetUrl(Endpoints.getUserDetails, token!);

    ///converting to response
    var registerResponse = ApiResponse<UserDetailsResponse>(
        status: Status.success,
        message: 'Success fully logged in',
        data: UserDetailsResponse.fromJson(apiResponse));

    return registerResponse;
  }
}
