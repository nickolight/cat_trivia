import 'dart:convert';

import 'package:cat_trivia/data/constants.dart';
import 'package:cat_trivia/data/models/cat_fact_model.dart';
import 'package:cat_trivia/domain/entities/cat_fact.dart';
import 'package:cat_trivia/domain/entities/cat_facts.dart';

List<CatFactModel> catFactsFromJson(String str) => List<CatFactModel>.from(
    json.decode(str).map((x) => CatFactModel.fromJson(x)));

String catFactsToJson(List<CatFactModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CatFactsModel {
  CatFactsModel(this.listOfCatFactsModel);

  List<CatFactModel> listOfCatFactsModel;

  CatFacts toEntity() => CatFacts(listOfCatFactsModel
      .map((catFactModel) => CatFact(
            image: Urls.randomCatImageUrl,
            text: catFactModel.text,
            createdAt: catFactModel.createdAt,
          ))
      .toList());
}
