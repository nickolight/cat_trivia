import 'package:cat_trivia/domain/entities/cat_fact.dart';
import 'package:cat_trivia/domain/entities/cat_facts.dart';

abstract class CatFactState {
  const CatFactState();
}

class CatFactsEmpty extends CatFactState {}

class CatFactsLoading extends CatFactState {}

class CatFactsLoadingError extends CatFactState {
  final String message;

  CatFactsLoadingError(this.message);
}

class CatFactsLoadedSuccessfully extends CatFactState {
  final CatFacts listOfCatFacts;

  CatFactsLoadedSuccessfully(this.listOfCatFacts);
}

class RandomCatFact extends CatFactState {
  final CatFact catFact;

  RandomCatFact(this.catFact);
}
