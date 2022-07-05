import 'package:amplify_flutter/amplify_flutter.dart';


confirmUser(String email , String code )async {
    try {
      var result = await Amplify.Auth.confirmSignUp(
        username: email,
        confirmationCode: code,
      );
      return result.isSignUpComplete;
    } on AuthException catch (e) {
      return false;
    }
  }
