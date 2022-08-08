import 'package:cat_trivia/data/failure.dart';
import 'package:cat_trivia/domain/entities/cat_facts.dart';
import 'package:cat_trivia/domain/repositories/cat_facts_repository.dart';
import 'package:either_dart/either.dart';

class GetCatFacts {
  final CatFactsRepository repository;

  GetCatFacts(this.repository);

  Future<Either<Failure, CatFacts>> execute() {
    return repository.getCatFacts();
  }
}
