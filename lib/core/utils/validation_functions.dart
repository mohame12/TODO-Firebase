String? validateEmail(String? value) {
  // Regular expression for validating an email
  String pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
  RegExp regex = RegExp(pattern);

  if (value == null || value.isEmpty) {
    return 'Please enter your email';
  } else if (!regex.hasMatch(value)) {
    return 'Please enter a valid email address';
  }
  return null; // If validation is successful, return null
}




String? validatePhone(String? value) {
  // Regular expression for validating a phone number
  String pattern = r'^\+?\d{7,15}$';
  RegExp regex = RegExp(pattern);

  if (value == null || value.isEmpty) {
    return 'Please enter your phone number';
  } else if (!regex.hasMatch(value)) {
    return 'Please enter a valid phone number';
  }
  return null; // If validation is successful, return null
}


String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your password';
  } else if (value.length < 6) {
    return 'Password must be at least 6 characters long';
  }
  return null; // If validation is successful, return null
}


String? validateRePassword(String? value, String? originalPassword) {
  if (value == null || value.isEmpty) {
    return 'Please confirm your password';
  } else if (value != originalPassword) {
    return 'Passwords do not match';
  }
  return null; // If validation is successful, return null
}