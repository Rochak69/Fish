import 'package:fish_shop/common/api_response.dart';
import 'package:fish_shop/common/status.dart';
import 'package:fish_shop/providers/api_client.dart';
import 'package:fish_shop/ui/utils/endpoints.dart';
import 'package:fish_shop/ui/utils/preferences.dart';
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
    );

    return registerResponse;
  }
}