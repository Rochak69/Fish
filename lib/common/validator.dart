class Validator {
  static String? validateEmpty(String? value) {
    // Empty validation logic here
    // You can add your custom validation rules

    if (value == null || value.isEmpty) {
      return 'This field is required';
    }

    return null; // Return null if the value is valid
  }
}
