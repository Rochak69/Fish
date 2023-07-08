import 'package:buyer_shop/common/api_response.dart';
import 'package:buyer_shop/common/status.dart';
import 'package:buyer_shop/providers/api_client.dart';
import 'package:buyer_shop/ui/register/model/register_response.dart';
import 'package:buyer_shop/ui/utils/endpoints.dart';
import 'package:buyer_shop/ui/utils/preferences.dart';
import 'package:injectable/injectable.dart';

@singleton
class VerifyOtpApiClient {
  ApiClient? _apiClient;

  VerifyOtpApiClient(ApiClient apiClient) {
    _apiClient = apiClient;
  }

  Future<ApiResponse?> verifyOtp({
    required String otp,
    required String userId,
  }) async {
    Preferences preferences = Preferences();

    ///or pass object directly to the http post
    Map<String, dynamic> data = {"code": otp, "userId": userId};

    var apiResponse = await _apiClient?.httpPost(Endpoints.verifyOtp, data);

    ///converting to response
    var response = ApiResponse(
        status: Status.success,
        message: 'Success fully registered',
        data: RegisterResponse.fromJson(apiResponse));

    return response;
  }
}
