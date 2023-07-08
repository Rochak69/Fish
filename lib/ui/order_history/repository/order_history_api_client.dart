import 'package:fish_shop/common/api_response.dart';
import 'package:fish_shop/common/status.dart';
import 'package:fish_shop/providers/api_client.dart';
import 'package:fish_shop/ui/order_history/model/order_history_response.dart';
import 'package:fish_shop/ui/utils/preferences.dart';
import 'package:injectable/injectable.dart';

import '../../utils/endpoints.dart';

@singleton
class OrderHistoryApiClient {
  ApiClient? _apiClient;

  OrderHistoryApiClient(ApiClient apiClient) {
    _apiClient = apiClient;
  }

  Future<ApiResponseForList?> getOrderhistory() async {
    Preferences preferences = Preferences();
    String? token = await preferences.getString(Preference.accessToken);

    ///or pass object directly to the http post

    var apiResponse = await _apiClient?.httpGetUrl(Endpoints.myOrders, token!);

    ///converting to response
    var response = ApiResponseForList(
      status: Status.success,
      message: 'Success',
      data: (apiResponse as List<dynamic>)
          .map((data) => OrderHistoryResponse.fromJson(data))
          .toList(),
    );

    return response;
  }

  Future<ApiResponse?> completeOrder(String id) async {
    Preferences preferences = Preferences();
    String? token = await preferences.getString(Preference.accessToken);

    ///or pass object directly to the http post

    var apiResponse =
        await _apiClient?.httpPatch(Endpoints.completeOrder(id), {});

    ///converting to response
    var response = ApiResponse(
      status: Status.success,
      message: 'Success',
    );

    return response;
  }

  Future<ApiResponse?> rejectOrder(String id) async {
    Preferences preferences = Preferences();
    String? token = await preferences.getString(Preference.accessToken);

    ///or pass object directly to the http post

    var apiResponse =
        await _apiClient?.httpPatch(Endpoints.rejectOrder(id), {});

    ///converting to response
    var response = ApiResponse(
      status: Status.success,
      message: 'Success',
    );

    return response;
  }
}
