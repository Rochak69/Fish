abstract class YeildFormState {}

class YeildFormInitial extends YeildFormState {}

class YeildFormSuccess extends YeildFormState {}

class YeildFormFailed extends YeildFormState {
  final String errorMessage;

  YeildFormFailed({required this.errorMessage});
}
