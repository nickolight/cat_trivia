import 'dart:io';

import 'package:cat_trivia/data/datasources/remote_data_source.dart';
import 'package:cat_trivia/data/exception.dart';
import 'package:cat_trivia/data/failure.dart';
import 'package:cat_trivia/domain/entities/cat_fact.dart';
import 'package:cat_trivia/domain/repositories/cat_fact_repository.dart';
import 'package:either_dart/either.dart';

class CatFactRepositoryImpl implements CatFactRepository {
  final RemoteDataSource remoteDataSource;

  CatFactRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, CatFact>> getCatFacts() async {
    try {
      final result = await remoteDataSource.getCatFact();
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
