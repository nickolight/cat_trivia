import 'package:cat_trivia/data/failure.dart';
import 'package:cat_trivia/domain/entities/cat_fact.dart';
import 'package:cat_trivia/domain/repositories/cat_fact_repository.dart';
import 'package:either_dart/either.dart';

class GetCatFact {
  final CatFactRepository repository;

  GetCatFact(this.repository);

  Future<Either<Failure, CatFact>> execute() {
    return repository.getCatFacts();
  }
}
