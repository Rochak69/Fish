import 'package:buyer_shop/common/api_response.dart';
import 'package:buyer_shop/common/status.dart';
import 'package:buyer_shop/providers/api_client.dart';
import 'package:buyer_shop/ui/register/model/register_response.dart';
import 'package:buyer_shop/ui/utils/endpoints.dart';
import 'package:buyer_shop/ui/utils/preferences.dart';
import 'package:injectable/injectable.dart';

@singleton
class RegisterApiClient {
  ApiClient? _apiClient;

  RegisterApiClient(ApiClient apiClient) {
    _apiClient = apiClient;
  }

  Future<ApiResponse?> register({
    required String phoneNumber,
    required String password,
    required String userName,
  }) async {
    Preferences preferences = Preferences();

    ///or pass object directly to the http post
    Map<String, dynamic> data = {
      'phoneNumber': phoneNumber,
      'password': password,
      'userName': userName
    };
    var apiResponse = await _apiClient?.httpPost(Endpoints.registerUrl, data);

    ///converting to response
    var registerResponse = ApiResponse(
        status: Status.success,
        message: 'Success fully registered',
        data: RegisterResponse.fromJson(apiResponse['data']));
    await preferences.saveString(
        Preference.userID, registerResponse.data?.userid);

    return registerResponse;
  }
}
