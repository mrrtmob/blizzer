import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:blizzer/models/Type.dart';

const getTodo = 'getType';
String graphQLDocument = '''query GetType(\$id: ID!) {
  $getTodo(id: \$id) {
    id
    typeName
  }
}''';
final getTodoRequest = GraphQLRequest<Type>(
    document: graphQLDocument,
    modelType: Type.classType,
    variables: <String, String>{'id': "a104f89e-f94e-4e11-a9f2-877ee7cf005b"},
    decodePath: getTodo,
);

Future<void> queryTodo(GraphQLRequest<Type> getTodoRequest) async {
  final response = await Amplify.API.query(request: getTodoRequest).response;
  print('Response: ${response.data}');
}