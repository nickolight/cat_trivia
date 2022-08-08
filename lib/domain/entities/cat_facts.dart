import 'dart:math';

import 'package:cat_trivia/domain/entities/cat_fact.dart';

class CatFacts {
  CatFacts(
    this.listOfCatFacts,
  );

  final List<CatFact> listOfCatFacts;

  CatFact getRandomCatFact() {
    return listOfCatFacts[Random().nextInt(listOfCatFacts.length)];
  }
}
