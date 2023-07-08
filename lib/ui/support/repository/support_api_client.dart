import 'package:fish_shop/common/api_response.dart';
import 'package:fish_shop/common/status.dart';
import 'package:fish_shop/providers/api_client.dart';
import 'package:fish_shop/ui/reset_password/model/reset_password_response.dart';
import 'package:fish_shop/ui/utils/endpoints.dart';
import 'package:fish_shop/ui/utils/preferences.dart';
import 'package:injectable/injectable.dart';

@singleton
class SupportApiClient {
  ApiClient? _apiClient;

  SupportApiClient(ApiClient apiClient) {
    _apiClient = apiClient;
  }

  Future<ApiResponse?> support({
    required String issue,
  }) async {
    Preferences preferences = Preferences();
    String? farmerId = await preferences.getString(Preference.farmerId);

    ///or pass object directly to the http post
    Map<String, dynamic> data = {"farmerId": farmerId, "issue": issue};
    var apiResponse = await _apiClient?.httpPost(Endpoints.farmerIssue, data);

    ///converting to response
    var response = ApiResponse(
        status: Status.success, message: 'Success reset password', data: null);

    return response;
  }
}
