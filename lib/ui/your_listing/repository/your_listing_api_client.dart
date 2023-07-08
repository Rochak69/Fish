import 'package:buyer_shop/common/api_response.dart';
import 'package:buyer_shop/common/status.dart';
import 'package:buyer_shop/providers/api_client.dart';
import 'package:buyer_shop/ui/utils/endpoints.dart';
import 'package:buyer_shop/ui/utils/preferences.dart';
import 'package:buyer_shop/ui/utils/utils.dart';
import 'package:buyer_shop/ui/your_listing/model/your_listing_model.dart';
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
    String? buyerId = await preferences.getString(Preference.buyerId);
    String? token = await preferences.getString(Preference.accessToken);
    if (buyerId == null) {
      displayToastMessage('Buyer Id is null');
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
    String? farmerId = await preferences.getString(Preference.buyerId);
    if (farmerId == null) {
      displayToastMessage('Buyer Id is null');
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
