import 'package:cat_trivia/data/failure.dart';
import 'package:cat_trivia/domain/entities/cat_facts.dart';
import 'package:either_dart/either.dart';

abstract class CatFactsRepository {
  Future<Either<Failure, CatFacts>> getCatFacts();
}