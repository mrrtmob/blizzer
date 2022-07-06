
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:blizzer/models/Type.dart';

Future<List<Type?>> queryCategories() async {
  try {
    final request = ModelQueries.list(Type.classType);
    final response = await Amplify.API.query(request: request).response;
    final categories = response.data?.items;
    if (categories == null) {
      print('errors: ${response.errors}');
      return <Type?>[];
    }
    return categories;
  } on ApiException catch (e) {
    print('Query failed: $e');
  }
  return <Type?>[];
}
