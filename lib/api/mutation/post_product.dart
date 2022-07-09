import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:blizzer/models/Item.dart';

Future createProduct(Item Product) async {
  try {
    final request = ModelMutations.create(Product);
    final response = await Amplify.API.mutate(request: request).response;
    final createdProduct = response.data;

    if (createdProduct == null) {
      print('errors: ${response.errors}');
      return null;
    }
    print('Mutation result: ${createdProduct.productName}');
    return createdProduct.id;
  } on ApiException catch (e) {
    print('Mutation failed: $e');
  }
}
