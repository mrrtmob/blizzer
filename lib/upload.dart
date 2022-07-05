import 'dart:io';
import 'package:amplify_api/model_mutations.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:blizzer/auth/current_user.dart';
import 'package:blizzer/constants.dart';
import 'package:blizzer/models/ModelProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:image_picker/image_picker.dart';

final picker = ImagePicker();

Future<void> getDownloadUrl() async {
  try {
    final result = await Amplify.Storage.getUrl(key: 'gg');
    // NOTE: This code is only for demonstration
    // Your debug console may truncate the printed url string
    print('Got URL: ${result.url}');
  } on StorageException catch (e) {
    print('Error getting download URL: $e');
  }
}

Future<void> uploadImage() async {
  // Select image from user's gallery
  final pickedFile = await picker.getImage(source: ImageSource.gallery);

  if (pickedFile == null) {
    print('No image selected');
    return;
  }

  // Upload image with the current time as the key
  final key = DateTime.now().toString();
  final file = File(pickedFile.path);
  try {
    // final auth = await Amplify.Auth.fetchUserAttributes();
    final UploadFileResult result = await Amplify.Storage.uploadFile(
      local: file,
      key: "gg",
      onProgress: (progress) {
        print('Fraction completed: ${progress.getFractionCompleted()}');
      },
    );
    print('Successfully uploaded image: ${result.key}');
  } on StorageException catch (e) {
    print('Error uploading image: $e');
  }
}

class Upload extends StatefulWidget {
  const Upload({Key? key}) : super(key: key);

  @override
  State<Upload> createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
              width: 1000,
              height: 500,
              fit: BoxFit.cover,
              image: NetworkImage("")),
          ElevatedButton(
              onPressed: () async {
                getDownloadUrl();
              },
              child: Text("Upload")),
        ],
      ),
    );
  }
}

Future<void> createTodo() async {
  try {
    final todo = Todo(name: 'my first todo', description: 'todo description');
    final request = ModelMutations.create(todo);
    final response = await Amplify.API.mutate(request: request).response;

    final createdTodo = response.data;
    if (createdTodo == null) {
      print('errors: ${response.errors}');
      return;
    }
    print('Mutation result: ${createdTodo.name}');
  } on ApiException catch (e) {
    print('Mutation failed: $e');
  }
}
