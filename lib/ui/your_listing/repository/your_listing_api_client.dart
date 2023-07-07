import 'package:fish_shop/common/api_response.dart';
import 'package:fish_shop/common/status.dart';
import 'package:fish_shop/providers/api_client.dart';
import 'package:fish_shop/ui/utils/endpoints.dart';
import 'package:fish_shop/ui/utils/preferences.dart';
import 'package:fish_shop/ui/utils/utils.dart';
import 'package:fish_shop/ui/your_listing/model/your_listing_model.dart';
import 'package:injectable/injectable.dart';

@singleton
class YourListingApiClient {
  ApiClient? _apiClient;

  YourListingApiClient(ApiClient apiClient) {
    _apiClient = apiClient;
  }

  Future<ApiResponseForList?> getMylistings() async {
    Preferences preferences = Preferences();

    ///or pass object directly to the http post
    String? farmerId = await preferences.getString(Preference.farmerId);
    String? token = await preferences.getString(Preference.accessToken);
    if (farmerId == null) {
      displayToastMessage('Farmer Id is null');
      throw Exception();
    }
    var apiResponse =
        await _apiClient?.httpGetUrl(Endpoints.getMyListings, token!);

    ///converting to response
    var registerResponse = ApiResponseForList(
      status: Status.success,
      message: 'Success fully registered',
      data: (apiResponse as List<dynamic>)
          .map((data) => YourListingsResponse.fromJson(data))
          .toList(),
    );

    return registerResponse;
  }

  Future<ApiResponse?> deleteMyListing({required String id}) async {
    Preferences preferences = Preferences();

    ///or pass object directly to the http post
    String? farmerId = await preferences.getString(Preference.farmerId);
    if (farmerId == null) {
      displayToastMessage('Farmer Id is null');
      throw Exception();
    }
    var apiResponse =
        await _apiClient?.httpDelete(Endpoints.deleteMyListing(id));

    ///converting to response
    var registerResponse =
        ApiResponse(status: Status.success, message: 'Deleted', data: null);

    return registerResponse;
  }
}
