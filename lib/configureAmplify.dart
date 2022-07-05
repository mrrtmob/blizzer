import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'package:blizzer/amplifyconfiguration.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:blizzer/models/ModelProvider.dart';

Future<void> configureAmplify() async {
  final auth = AmplifyAuthCognito();
  final api = AmplifyAPI(modelProvider: ModelProvider.instance);
  final storage = AmplifyStorageS3();
  await Amplify.addPlugins([auth, api,storage]);
  try {
    // call Amplify.configure to use the initialized categories in your app
    await Amplify.configure(amplifyconfig);
  } on Exception catch (e) {
    print('An error occurred configuring Amplify: $e');
  }
}
