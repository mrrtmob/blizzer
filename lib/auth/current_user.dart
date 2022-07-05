import 'package:amplify_flutter/amplify_flutter.dart';

Future<AuthUser> getCurrentUser() async {
  final user = await Amplify.Auth.getCurrentUser();
  return user;
}