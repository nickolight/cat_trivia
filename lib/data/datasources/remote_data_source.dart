import 'package:cat_trivia/data/constants.dart';
import 'package:cat_trivia/data/exception.dart';
import 'package:cat_trivia/data/models/cat_fact_model.dart';
import 'package:http/http.dart' as http;

abstract class RemoteDataSource {
  Future<CatFactModel> getCatFact();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final http.Client client;
  RemoteDataSourceImpl({required this.client});

  @override
  Future<CatFactModel> getCatFact() async {
    final response =
    await client.get(Uri.parse(Urls.factsUrl));

    if (response.statusCode == 200) {
      return catFactFromJson(response.body);
    } else {
      throw ServerException();
    }
  }
}