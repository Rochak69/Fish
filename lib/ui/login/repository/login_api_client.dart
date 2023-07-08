import 'package:buyer_shop/common/api_response.dart';
import 'package:buyer_shop/common/status.dart';
import 'package:buyer_shop/providers/api_client.dart';
import 'package:buyer_shop/ui/login/model/login_response.dart';
import 'package:buyer_shop/ui/utils/endpoints.dart';
import 'package:buyer_shop/ui/utils/preferences.dart';
import 'package:injectable/injectable.dart';

@singleton
class LoginApiClient {
  ApiClient? _apiClient;

  LoginApiClient(ApiClient apiClient) {
    _apiClient = apiClient;
  }

  Future<ApiResponse?> login({
    required String phoneNumber,
    required String password,
  }) async {
    Preferences preferences = Preferences();

    ///or pass object directly to the http post
    Map<String, dynamic> data = {
      'phoneNumber': phoneNumber,
      'password': password,
    };
    var apiResponse = await _apiClient?.httpPost(Endpoints.loginUrl, data);

    ///converting to response
    var registerResponse = ApiResponse(
        status: Status.success,
        message: 'Success fully logged in',
        data: LoginResponse.fromJson(apiResponse));

    await preferences.saveString(Preference.userID, apiResponse['id']);

    return registerResponse;
  }
}
