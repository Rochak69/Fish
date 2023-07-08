import 'package:buyer_shop/common/api_response.dart';
import 'package:buyer_shop/common/status.dart';
import 'package:buyer_shop/providers/api_client.dart';
import 'package:buyer_shop/ui/utils/endpoints.dart';
import 'package:buyer_shop/ui/utils/preferences.dart';
import 'package:injectable/injectable.dart';

@singleton
class PendingRequestPerListingApiClient {
  ApiClient? _apiClient;

  PendingRequestPerListingApiClient(ApiClient apiClient) {
    _apiClient = apiClient;
  }

  Future<ApiResponse?> acceptRequest(String id) async {
    Preferences preferences = Preferences();

    ///or pass object

    var apiResponse =
        await _apiClient?.httpPatch(Endpoints.acceptFarmerRequest(id), {});

    ///converting to response
    var response = ApiResponse(
        status: Status.success, message: 'Successfully got', data: null);

    return response;
  }

  Future<ApiResponse?> rejectRequest(String id) async {
    Preferences preferences = Preferences();

    ///or pass object

    var apiResponse = await _apiClient?.httpDelete(
      Endpoints.rejectFarmerRequest(id),
    );

    ///converting to response
    var response = ApiResponse(
        status: Status.success, message: 'Successfully got', data: null);

    return response;
  }
}
