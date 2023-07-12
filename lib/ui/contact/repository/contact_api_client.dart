import 'package:fish_shop/common/api_response.dart';
import 'package:fish_shop/common/status.dart';
import 'package:fish_shop/providers/api_client.dart';
import 'package:fish_shop/ui/contact/model/contact_response.dart';
import 'package:fish_shop/ui/utils/endpoints.dart';
import 'package:fish_shop/ui/utils/preferences.dart';
import 'package:injectable/injectable.dart';

@singleton
class ContactApiClient {
  ApiClient? _apiClient;

  ContactApiClient(ApiClient apiClient) {
    _apiClient = apiClient;
  }

  Future<ApiResponse<ContactResponse>?> getContact() async {
    Preferences preferences = Preferences();

    var apiResponse = await _apiClient?.httpGet(Endpoints.contact);

    ///converting to response
    var resposne = ApiResponse(
        status: Status.success,
        message: 'Success fully Contacted',
        data: ContactResponse.fromJson(apiResponse));

    return resposne;
  }
}
