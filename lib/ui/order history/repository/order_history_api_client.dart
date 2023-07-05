import 'package:fish_shop/common/api_response.dart';
import 'package:fish_shop/common/status.dart';
import 'package:fish_shop/providers/api_client.dart';
import 'package:fish_shop/ui/reset_password/model/reset_password_response.dart';
import 'package:fish_shop/ui/utils/endpoints.dart';
import 'package:fish_shop/ui/utils/preferences.dart';
import 'package:injectable/injectable.dart';

@singleton
class OrderHistoryApiClient {
  ApiClient? _apiClient;

  OrderHistoryApiClient(ApiClient apiClient) {
    _apiClient = apiClient;
  }

  Future<ApiResponse?> getOrderhistory() async {
    Preferences preferences = Preferences();

    ///or pass object directly to the http post

    var apiResponse = await _apiClient?.httpGet(Endpoints.resetPassword);

    ///converting to response
    var response = ApiResponse(
        status: Status.success,
        message: 'Success reset password',
        data: ResetPasswordResponse.fromJson(apiResponse));

    return response;
  }
}
