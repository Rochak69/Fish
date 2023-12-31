import 'package:buyer_shop/common/api_response.dart';
import 'package:buyer_shop/common/status.dart';
import 'package:buyer_shop/providers/api_client.dart';
import 'package:buyer_shop/ui/reset_password/model/reset_password_response.dart';
import 'package:buyer_shop/ui/utils/endpoints.dart';
import 'package:buyer_shop/ui/utils/preferences.dart';
import 'package:injectable/injectable.dart';

@singleton
class OrderHistoryApiClient {
  ApiClient? _apiClient;

  OrderHistoryApiClient(ApiClient apiClient) {
    _apiClient = apiClient;
  }

  Future<ApiResponse?> getOrderhistory() async {
    Preferences preferences = Preferences();
    String? token = await preferences.getString(Preference.accessToken);

    ///or pass object directly to the http post

    var apiResponse = await _apiClient?.httpGetUrl(Endpoints.myOrders, token!);

    ///converting to response
    var response = ApiResponse(
        status: Status.success,
        message: 'Success',
        data: ResetPasswordResponse.fromJson(apiResponse));

    return response;
  }
}
