import 'package:buyer_shop/common/api_response.dart';
import 'package:buyer_shop/common/status.dart';
import 'package:buyer_shop/providers/api_client.dart';
import 'package:buyer_shop/ui/reset_password/model/reset_password_response.dart';
import 'package:buyer_shop/ui/utils/endpoints.dart';
import 'package:buyer_shop/ui/utils/preferences.dart';
import 'package:injectable/injectable.dart';

@singleton
class ResetPasswordApiClient {
  ApiClient? _apiClient;

  ResetPasswordApiClient(ApiClient apiClient) {
    _apiClient = apiClient;
  }

  Future<ApiResponse?> resetPassword({
    required String password,
    required String userId,
  }) async {
    Preferences preferences = Preferences();

    ///or pass object directly to the http post
    Map<String, dynamic> data = {
      "id": userId,
      'password': password,
    };
    var apiResponse =
        await _apiClient?.httpPatch(Endpoints.resetPassword, data);

    ///converting to response
    var response = ApiResponse(
        status: Status.success,
        message: 'Success reset password',
        data: ResetPasswordResponse.fromJson(apiResponse));
    await preferences.saveString(
        Preference.accessToken, response.data?.sessionToken ?? '');
    await preferences.saveString(Preference.userID, response.data?.id ?? '');

    return response;
  }
}
