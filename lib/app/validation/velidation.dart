import 'package:get/get.dart';

class Validation {
  // ignore: non_constant_identifier_names
  static String? NameValid({String? Name = null}) {
    if (Name == null || Name.isEmpty) {
      return "Please Enter Name".tr;
    }
    return null;
  }

  // ignore: non_constant_identifier_names
  static String? EmailValid({String? email}) {
    if (email == null || email.isEmpty) {
      return "Please Enter Email";
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email)) {
      return 'Enter Valid Email';
    }
    return null;
  }

  // ignore: non_constant_identifier_names
  static String? PasswordValid({String? password = null}) {
    if (password == null || password.isEmpty) {
      return "Please Enter Password";
    } else if (!RegExp(
            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
        .hasMatch(password)) {
      return 'Enter Valid Password  & Minimum 8 Digits';
    }
    return null;
  }
  static String? Pin({String? pin = null}) {
    if (pin == null || pin.isEmpty) {
      return "Please Enter pin".tr;
    }else if(pin.length !=4 )
      {
        return "Please Enter valid pin".tr;
      }
    return null;
  }

  // ignore: non_constant_identifier_names
  static String? Con_PasswordValid(
      // ignore: non_constant_identifier_names
      {String? Con_password, String? password}) {
    if (Con_password == null || Con_password.isEmpty) {
      return "Please Enter Confirm Password".tr;
    } else if (password != Con_password) {
      return 'Password not Match'.tr;
    }
    return null;
  }

  // ignore: non_constant_identifier_names
  static String? NumberValid({String? Number}) {
    if (Number == null || Number.isEmpty) {
      return "Please Enter Number".tr;
    } else if (Number.isNotEmpty && Number.length < 10) {
      return 'Number not valid'.tr;
    }
    return null;
  }

  // ignore: non_constant_identifier_names
  static String? NumberOrEmail({String? NumberEmail}) {
    if (NumberEmail == null || NumberEmail.trim().isEmpty) {
      return "Please Enter Number or Email";
    } else if (RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(NumberEmail)) {
      return null;
    } else if (!(NumberEmail.isNotEmpty && NumberEmail.length == 10)) {
      return "Number not valid";
    } else {
      return null;
    }
  }
}
