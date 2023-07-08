import 'package:buyer_shop/common/api_response.dart';
import 'package:buyer_shop/common/status.dart';
import 'package:buyer_shop/providers/api_client.dart';
import 'package:buyer_shop/ui/forgot_password/model/send_otp_response.dart';
import 'package:buyer_shop/ui/utils/endpoints.dart';
import 'package:buyer_shop/ui/utils/preferences.dart';
import 'package:injectable/injectable.dart';

@singleton
class SendOtpApiClient {
  ApiClient? _apiClient;

  SendOtpApiClient(ApiClient apiClient) {
    _apiClient = apiClient;
  }

  Future<ApiResponse?> sendOtp({
    required String phoneNumber,
  }) async {
    Preferences preferences = Preferences();

    ///or pass object directly to the http post
    Map<String, dynamic> data = {
      'phoneNumber': phoneNumber,
    };
    var apiResponse = await _apiClient?.httpPost(Endpoints.otpUrl, data);

    ///converting to response
    var response = ApiResponse(
        status: Status.success,
        message: 'Success fully registered',
        data: SendOtpResponse.fromJson(apiResponse));
    await preferences.saveString(
        Preference.userID, response.data?.userId ?? '');

    return response;
  }
}
