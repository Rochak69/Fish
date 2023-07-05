import 'package:fish_shop/common/api_response.dart';
import 'package:fish_shop/common/status.dart';
import 'package:fish_shop/providers/api_client.dart';
import 'package:fish_shop/ui/utils/endpoints.dart';
import 'package:fish_shop/ui/utils/preferences.dart';
import 'package:fish_shop/ui/yield_farm/model/yeild_form_response.dart';
import 'package:injectable/injectable.dart';

@singleton
class YeildFormApiClient {
  ApiClient? _apiClient;

  YeildFormApiClient(ApiClient apiClient) {
    _apiClient = apiClient;
  }

  Future<ApiResponse?> createFarmerSupply({
    required String fishType,
    required double avgFishWeight,
    required double totalWeight,
    required String yieldDate,
  }) async {
    Preferences preferences = Preferences();
    String? farmerId = await preferences.getString(Preference.farmerId);

    ///or pass object directly to the http post
    Map<String, dynamic> data = {
      "fishType": fishType,
      "avgFishWeight": avgFishWeight,
      "totalWeight": totalWeight,
      "yieldDate": yieldDate,
      "farmerId": farmerId
    };
    var apiResponse =
        await _apiClient?.httpPost(Endpoints.createFarmersSupply, data);

    ///converting to response
    var response = ApiResponse(
        status: Status.success,
        message: 'Success fully registered',
        data: YeildFormResponse.fromJson(apiResponse));

    return response;
  }
}
