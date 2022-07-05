import 'package:amplify_flutter/amplify_flutter.dart';

signin(String email, String password) async {
  try {
    final result = await Amplify.Auth.signIn(
      username: email,
      password: password,
    );
    return result.isSignedIn;
  } on AuthException catch (e) {
    print(e);
    return false;
  }
}
