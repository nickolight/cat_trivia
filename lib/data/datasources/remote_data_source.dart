import 'package:cat_trivia/data/constants.dart';
import 'package:cat_trivia/data/exception.dart';
import 'package:cat_trivia/data/models/cat_facts_model.dart';
import 'package:http/http.dart' as http;

abstract class RemoteDataSource {
  Future<CatFactsModel> getCatFacts();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final http.Client client;

  RemoteDataSourceImpl({required this.client});

  @override
  Future<CatFactsModel> getCatFacts() async {
    final response = await client.get(Uri.parse(Urls.factsUrl));

    if (response.statusCode == 200) {
      return CatFactsModel(catFactsFromJson(response.body));
    } else {
      throw ServerException();
    }
  }
}
