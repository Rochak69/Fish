import 'package:buyer_shop/common/api_response.dart';
import 'package:buyer_shop/common/status.dart';
import 'package:buyer_shop/providers/api_client.dart';
import 'package:buyer_shop/ui/utils/endpoints.dart';
import 'package:buyer_shop/ui/utils/preferences.dart';
import 'package:buyer_shop/ui/yield_farm/model/yeild_form_response.dart';
import 'package:injectable/injectable.dart';

@singleton
class YeildFormApiClient {
  ApiClient? _apiClient;

  YeildFormApiClient(ApiClient apiClient) {
    _apiClient = apiClient;
  }

  Future<ApiResponse?> createBuyerDemand({
    required String fishType,
    required double avgFishWeight,
    required double totalWeight,
    required String yieldDate,
  }) async {
    Preferences preferences = Preferences();
    String? buyerId = await preferences.getString(Preference.buyerId);

    ///or pass object directly to the http post
    Map<String, dynamic> data = {
      "buyerId": buyerId,
      "fishType": fishType,
      "avgFishWeight": avgFishWeight,
      "totalWeight": totalWeight,
      "deadline": yieldDate
    };
    var apiResponse =
        await _apiClient?.httpPost(Endpoints.createBuyerDemand, data);

    ///converting to response
    var response = ApiResponse(
        status: Status.success,
        message: 'Success fully registered',
        data: YeildFormResponse.fromJson(apiResponse));

    return response;
  }
}
