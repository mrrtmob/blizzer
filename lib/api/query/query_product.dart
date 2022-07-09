
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:blizzer/models/Item.dart';
import 'package:blizzer/models/ModelProvider.dart';
Future<List<Item?>> queryItems() async {
  try {
    final request = ModelQueries.list(Item.classType);
    final response = await Amplify.API.query(request: request).response;
    final categories = response.data?.items ;
    if (categories == null) {
      print('errors: ${response.errors}');
      return <Item>[];
    }
    return categories;
  } on ApiException catch (e) {
    print('Query failed: $e');
  }
  return <Item>[];
}