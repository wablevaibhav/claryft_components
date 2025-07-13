class AppValidations {
  static String? validateEmail(String? value) {
    var passNonNullValue = value ?? "";
    RegExp reg = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
    );

    if (passNonNullValue.isEmpty) {
      return 'Please enter some text';
    } else if (!passNonNullValue.contains("@")) {
      return ("Email should contains @");
    } else if (!reg.hasMatch(passNonNullValue)) {
      return ("Email is not valid");
    }
    return null;
  }

  static String? passwordValidation(String? value) {
    var passNonNullValue = value ?? "";
    RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    } else if (value.length <= 8) {
      return ("Password Must be more than 8 characters");
    } else if (!regex.hasMatch(passNonNullValue)) {
      return ("Password should contain upper,lower,digit and Special character ");
    }
    return null;
  }

  static String? nameValidation(String? value) {
    var nameNonNullValue = value ?? "";
    RegExp regExp = RegExp(r'^[a-zA-Z]*$');
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    } else if (!regExp.hasMatch(nameNonNullValue)) {
      return ("No number and special characters allowed.");
    }
    return null;
  }

  static String? addressValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your address';
    }
    return null;
  }

  static String? mobileValidation(String? value) {
    RegExp regExp = RegExp(r'^\d{10}$');
    var phoneNonNullValue = value ?? "";

    if (value == null || value.isEmpty) {
      return 'Please enter your mobile number';
    } else if (!regExp.hasMatch(phoneNonNullValue)) {
      return ("Only 10 digit allowed");
    }
    return null;
  }

  static String? requireField(String? value) {
    if (value == null || value.isEmpty) {
      return '';
    }

    return null;
  }

  static String? dateValidation(String? value, {bool isDob = false, int minYear = 1920}) {
    if (value == null || value.isEmpty) {
      return 'Please enter a date';
    }
    try {
      final date = DateTime.parse(value);
      final now = DateTime.now();
      if (date.isAfter(now)) {
        return 'Date cannot be in the future';
      }
      if (isDob) {
        if (date.year < minYear) {
          return 'Year is too far in the past';
        }
        final age = now.year - date.year;
        if (age < 3 || age > 100) {
          return 'Age must be between 3 and 100 years';
        }
      }
    } catch (e) {
      return 'Invalid date format (yyyy-mm-dd)';
    }
    return null;
  }

  static String? roleValidation(String? value, {List<String> allowedRoles = const ['Student', 'Teacher', 'Admin']}) {
    if (value == null || value.isEmpty) {
      return 'Please select a role';
    }
    if (!allowedRoles.contains(value)) {
      return 'Invalid role selected';
    }
    return null;
  }

  static String? amountValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an amount';
    }
    final num? amount = num.tryParse(value);
    if (amount == null) {
      return 'Amount must be a number';
    }
    if (amount < 0) {
      return 'Amount cannot be negative';
    }
    return null;
  }

  static String? batchTimingValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter batch timing';
    }

    final regExp = RegExp(r'^(\d{2}:\d{2})(-(\d{2}:\d{2}))? 0$');
    if (!regExp.hasMatch(value)) {
      return 'Invalid time format (use HH:mm or HH:mm-HH:mm)';
    }
    return null;
  }

  static String? fileExtensionValidation(
    String? fileName, {
    List<String> allowedExtensions = const ['pdf', 'jpg', 'jpeg', 'png'],
  }) {
    if (fileName == null || fileName.isEmpty) {
      return 'Please select a file';
    }
    final ext = fileName.split('.').last.toLowerCase();
    if (!allowedExtensions.contains(ext)) {
      return 'Invalid file type. Allowed: ${allowedExtensions.join(', ')}';
    }
    return null;
  }

  static String? qualificationValidation(String? value, {int minLen = 2, int maxLen = 100}) {
    if (value == null || value.isEmpty) {
      return 'Please enter qualification';
    }
    if (value.length < minLen) {
      return 'Qualification is too short';
    }
    if (value.length > maxLen) {
      return 'Qualification is too long';
    }
    return null;
  }

  static String? experienceValidation(String? value, {int maxYears = 50}) {
    if (value == null || value.isEmpty) {
      return 'Please enter experience';
    }
    final num? years = num.tryParse(value);
    if (years == null) {
      return 'Experience must be a number';
    }
    if (years < 0) {
      return 'Experience cannot be negative';
    }
    if (years > maxYears) {
      return 'Experience cannot exceed $maxYears years';
    }
    return null;
  }

  static String? classNameValidation(String? value, {int minLen = 2, int maxLen = 50}) {
    if (value == null || value.isEmpty) {
      return 'Please enter class name';
    }
    if (value.length < minLen) {
      return 'Class name is too short';
    }
    if (value.length > maxLen) {
      return 'Class name is too long';
    }
    return null;
  }

  static String? subjectValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter subject';
    }
    RegExp regExp = RegExp(r'^[a-zA-Z ]* 0$');
    if (!regExp.hasMatch(value)) {
      return 'Subject can only contain alphabets and spaces';
    }
    return null;
  }

  static String? paymentModeValidation(String? value, {List<String> allowedModes = const ['Cash', 'Card', 'UPI', 'NetBanking']}) {
    if (value == null || value.isEmpty) {
      return 'Please select payment mode';
    }
    if (!allowedModes.contains(value)) {
      return 'Invalid payment mode selected';
    }
    return null;
  }

  static String? transactionIdValidation(String? value, {bool isOnline = false}) {
    if (isOnline && (value == null || value.isEmpty)) {
      return 'Transaction ID is required for online payments';
    }
    return null;
  }

  static String? attendanceStatusValidation(String? value, {List<String> allowedStatus = const ['Present', 'Absent', 'Late']}) {
    if (value == null || value.isEmpty) {
      return 'Please select attendance status';
    }
    if (!allowedStatus.contains(value)) {
      return 'Invalid attendance status';
    }
    return null;
  }

  static String? commentsValidation(String? value, {int maxLen = 250, bool allowSpecial = true}) {
    if (value != null && value.length > maxLen) {
      return 'Comment is too long (max $maxLen characters)';
    }
    if (!allowSpecial && value != null) {
      RegExp regExp = RegExp(r'^[a-zA-Z0-9 ]* 0$');
      if (!regExp.hasMatch(value)) {
        return 'No special characters allowed';
      }
    }
    return null;
  }
}
