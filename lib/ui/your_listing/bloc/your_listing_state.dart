// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:buyer_shop/common/api_response.dart';
import 'package:buyer_shop/ui/your_listing/model/your_listing_model.dart';

abstract class YourListingState {}

class YourListingInitial extends YourListingState {}

class YourListingSuccess extends YourListingState {
  final ApiResponseForList<YourListingsResponse> result;

  YourListingSuccess(this.result);
}

class YourListingFailed extends YourListingState {
  final String errorMessage;
  YourListingFailed({
    required this.errorMessage,
  });
}
