abstract class YeildFormEvent {}

class PostYeildForm extends YeildFormEvent {
  String fishType;
  double avgFishWeight;
  double totalWeight;
  String deadline;

  PostYeildForm(
      {required this.avgFishWeight,
      required this.fishType,
      required this.totalWeight,
      required this.deadline});
}
