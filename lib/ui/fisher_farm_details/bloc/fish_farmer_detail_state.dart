// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class FishFarmerDetailState {}

class FishFarmerDetailInitial extends FishFarmerDetailState {}

class FishFarmerDetailSuccess extends FishFarmerDetailState {}

class FishFarmerDetailFailed extends FishFarmerDetailState {
  final String errorMessage;
  FishFarmerDetailFailed({
    required this.errorMessage,
  });
}
