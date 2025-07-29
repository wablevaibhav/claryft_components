class AppValidations {
  static String? validateEmail(String? value) {
    final email = value?.trim() ?? '';
    final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

    const allowedDomains = [
      'gmail.com',
      'outlook.com',
      'hotmail.com',
      'yahoo.com',
      'icloud.com',
      'live.com',
      'msn.com',
      'mail.com',
      'protonmail.com',
    ];
    if (email.isEmpty) {
      return 'Please enter your email address';
    }
    if (!email.contains('@')) {
      return 'Email must contain @ symbol';
    }
    if (!emailRegex.hasMatch(email)) {
      return 'Please enter a valid email format';
    }
    final parts = email.split('@');
    if (parts.length != 2) {
      return 'Invalid email structure';
    }

    final domain = parts[1].toLowerCase();
    final isValidDomain = allowedDomains.any((d) => domain == d);
    if (!isValidDomain) {
      return 'Only emails from Gmail, Outlook, Hotmail, Yahoo, etc. are allowed';
    }

    return null;
  }

  static String? validateOTP(String? value) {
    final otp = value?.trim() ?? '';

    if (otp.isEmpty) {
      return 'Please enter the OTP';
    }
    final isNumeric = RegExp(r'^\d+$').hasMatch(otp);
    if (!isNumeric) {
      return 'OTP must contain only digits';
    }
    if (otp.length != 6) {
      return 'OTP must be exactly 6 digits';
    }

    return null;
  }

  static String? passwordValidation(String? value) {
    var passNonNullValue = value ?? "";
    RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    } else if (value.length < 8) {
      return ("Password must be at least 8 characters");
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

  static String? requiredField(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
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

    final regExp = RegExp(r'^(\d{2}:\d{2})(-(\d{2}:\d{2}))?$');
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
    RegExp regExp = RegExp(r'^[a-zA-Z ]*$');
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
      RegExp regExp = RegExp(r'^[a-zA-Z0-9 ]*$');
      if (!regExp.hasMatch(value)) {
        return 'No special characters allowed';
      }
    }
    return null;
  }

  static String? yearValidation(String? value, {int minYear = 1900, int? maxYear}) {
    if (value == null || value.isEmpty) {
      return 'Please enter a year';
    }

    final year = int.tryParse(value);
    final currentYear = DateTime.now().year;
    final upperLimit = maxYear ?? currentYear;

    if (year == null) {
      return 'Year must be a valid number';
    }
    if (year < minYear) {
      return 'Year cannot be before $minYear';
    }
    if (year > upperLimit) {
      return 'Year cannot be after $upperLimit';
    }

    return null;
  }

  static String? totalCountValidation(String? value, {String label = 'Count'}) {
    if (value == null || value.isEmpty) {
      return 'Please enter $label';
    }

    final int? count = int.tryParse(value);
    if (count == null) {
      return '$label must be a number';
    }
    if (count < 0) {
      return '$label cannot be negative';
    }
    return null;
  }
}
