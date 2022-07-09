import 'dart:io';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:blizzer/components/show_dialog.dart';
import 'package:image_picker/image_picker.dart';

Future<void> uploadImage(String key, List<XFile> images) async {
  
  for (int i = 0; i < images.length; i++) {
    try {
      var file = File(images[i].path);
      final UploadFileResult result = await Amplify.Storage.uploadFile(
        local: file,
        key: key + images[i].name,
        onProgress: (progress) {
          print('Fraction completed: ${progress.getFractionCompleted()}');
        },
      );
      print('Successfully uploaded image: ${result.key}');
    } on StorageException catch (e) {
      print('Error uploading image: $e');
    }
  }
}
