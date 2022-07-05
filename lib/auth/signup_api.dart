import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';


  signup(String email, String password,String phoneNumber) async {
    try {
      final userAttributes = <CognitoUserAttributeKey, String>{
        CognitoUserAttributeKey.preferredUsername:email,
        CognitoUserAttributeKey.email: email,
        CognitoUserAttributeKey.custom('role') : 'admin'
      };
     var result =  await Amplify.Auth.signUp(
        username: email,
        password: password,
        options: CognitoSignUpOptions(userAttributes: userAttributes),
      );
      return result.isSignUpComplete;
    } on AuthException catch (e) {
      return false;
    }
  }

