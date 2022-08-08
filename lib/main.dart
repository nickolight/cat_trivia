import 'package:cat_trivia/presentation/bloc/cat_fact_bloc.dart';
import 'package:cat_trivia/presentation/bloc/cat_fact_event.dart';
import 'package:cat_trivia/presentation/pages/cat_fact_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'injection.dart' as di;

void main() {
  di.init();
  runApp(const CatTriviaApp());
}

class CatTriviaApp extends StatelessWidget {
  const CatTriviaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.locator<CatFactBloc>()..add(DownloadCatFacts()),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const CatFactPage(),
      ),
    );
  }
}
