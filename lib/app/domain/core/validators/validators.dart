String? requiredFieldValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'This field is required';
  }
  ;
  return null;
}

String? optionalFieldValidator(String? value) {
  if (value == null) {
    return null;
  }
  if (value.isNotEmpty && value.length < 3) {
    return 'The content should not be less than 3 characters';
  }
  return null;
}
