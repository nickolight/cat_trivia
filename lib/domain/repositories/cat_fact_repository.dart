import 'package:cat_trivia/data/failure.dart';
import 'package:cat_trivia/domain/entities/cat_fact.dart';
import 'package:either_dart/either.dart';

abstract class CatFactRepository {
  Future<Either<Failure, CatFact>> getCatFacts();
}