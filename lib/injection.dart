import 'package:cat_trivia/data/datasources/remote_data_source.dart';
import 'package:cat_trivia/data/repositories/cat_facts_repository_impl.dart';
import 'package:cat_trivia/domain/repositories/cat_facts_repository.dart';
import 'package:cat_trivia/domain/usecases/get_cat_facts.dart';
import 'package:cat_trivia/presentation/bloc/cat_fact_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void init() {
  // bloc
  locator.registerFactory(() => CatFactBloc(locator()));

  // usecase
  locator.registerLazySingleton(() => GetCatFacts(locator()));

  // repository
  locator.registerLazySingleton<CatFactsRepository>(
        () => CatFactsRepositoryImpl(
      remoteDataSource: locator(),
    ),
  );

  // data source
  locator.registerLazySingleton<RemoteDataSource>(
        () => RemoteDataSourceImpl(
      client: locator(),
    ),
  );

  // external
  locator.registerLazySingleton(() => http.Client());
}