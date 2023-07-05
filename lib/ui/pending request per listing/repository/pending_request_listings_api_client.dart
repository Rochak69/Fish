import 'package:fish_shop/common/api_response.dart';
import 'package:fish_shop/common/status.dart';
import 'package:fish_shop/providers/api_client.dart';
import 'package:fish_shop/ui/home_listing/model/home_listings_response.dart';
import 'package:fish_shop/ui/utils/endpoints.dart';
import 'package:fish_shop/ui/utils/preferences.dart';
import 'package:injectable/injectable.dart';

@singleton
class PendingRequestPerListingApiClient {
  ApiClient? _apiClient;

  PendingRequestPerListingApiClient(ApiClient apiClient) {
    _apiClient = apiClient;
  }

  Future<ApiResponseForList?> getPendingRequestPerListing() async {
    Preferences preferences = Preferences();

    ///or pass object

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
}
