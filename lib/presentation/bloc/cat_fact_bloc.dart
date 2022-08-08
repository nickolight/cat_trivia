import 'package:cat_trivia/domain/entities/cat_facts.dart';
import 'package:cat_trivia/domain/usecases/get_cat_facts.dart';
import 'package:cat_trivia/presentation/bloc/cat_fact_event.dart';
import 'package:cat_trivia/presentation/bloc/cat_fact_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatFactBloc extends Bloc<CatFactEvent, CatFactState> {
  final GetCatFacts _getCatFacts;

  late final CatFacts _catFacts;

  CatFactBloc(this._getCatFacts) : super(CatFactsEmpty()) {
    on<DownloadCatFacts>((event, emit) async {
      emit(CatFactsLoading());

      final result = await _getCatFacts.execute();
      result.fold(
        (failure) {
          emit(CatFactsLoadingError(failure.message));
        },
        (data) {
          _catFacts = data;
          emit(CatFactsLoadedSuccessfully(_catFacts));
        },
      );
    });
    on<GetRandomCatFact>((event, emit) async {
      emit(CatFactsLoading());

      emit(RandomCatFact(_catFacts.getRandomCatFact()));
    });
  }
}
