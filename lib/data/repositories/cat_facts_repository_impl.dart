import 'dart:io';

import 'package:cat_trivia/data/datasources/remote_data_source.dart';
import 'package:cat_trivia/data/exception.dart';
import 'package:cat_trivia/data/failure.dart';
import 'package:cat_trivia/domain/entities/cat_facts.dart';
import 'package:cat_trivia/domain/repositories/cat_facts_repository.dart';
import 'package:either_dart/either.dart';

class CatFactsRepositoryImpl implements CatFactsRepository {
  final RemoteDataSource remoteDataSource;

  CatFactsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, CatFacts>> getCatFacts() async {
    try {
      final result = await remoteDataSource.getCatFacts();
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
