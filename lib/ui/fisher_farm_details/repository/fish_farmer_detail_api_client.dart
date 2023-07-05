import 'package:fish_shop/common/api_response.dart';
import 'package:fish_shop/common/status.dart';
import 'package:fish_shop/providers/api_client.dart';
import 'package:fish_shop/ui/utils/endpoints.dart';
import 'package:fish_shop/ui/utils/preferences.dart';
import 'package:injectable/injectable.dart';

@singleton
class FishFarmerDetailApiClient {
  ApiClient? _apiClient;

  FishFarmerDetailApiClient(ApiClient apiClient) {
    _apiClient = apiClient;
  }

  Future<ApiResponse?> postdetails({
    required String userId,
    String? profilePicture,
    String? farmName,
    int? pondSize,
    String? pradesh,
    String? district,
    String? mahaNagarpalika,
    required String locationKey,
    String? gaupalika,
    String? location,
    int? woda,
  }) async {
    Preferences preferences = Preferences();

    ///or pass object directly to the http post
    Map<String, dynamic> data = {
      "userId": userId,
      "farmName": farmName,
      "profilePicture": "qwe",
      "pondSize": pondSize,
      "pradesh": pradesh,
      "district": district,
      locationKey: location,
      "Woda": woda,
      "idenfication": "asdasdasd",
      "registration": "asdasdasd"
    };
    var apiResponse =
        await _apiClient?.httpPost(Endpoints.fishFarmerDetails, data);

    ///converting to response
    var response = ApiResponse(
        status: Status.success, message: 'Success fully logged in', data: null);

    return response;
  }
}
