import 'package:cat_trivia/domain/entities/cat_fact.dart';
import 'package:cat_trivia/presentation/bloc/cat_fact_bloc.dart';
import 'package:cat_trivia/presentation/bloc/cat_fact_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatFactPage extends StatelessWidget {
  const CatFactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Cat Fact',
          style: TextStyle(color: Colors.blueAccent),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<CatFactBloc, CatFactState>(
          builder: (context, state) {
            if (state is CatFactsLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is RandomCatFact) {
              CatFact catFact = state.catFact;

              return Column(
                children: [
                  Image(
                    image: NetworkImage(
                      catFact.image,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    catFact.text,
                    style: const TextStyle(color: Colors.black),
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    catFact.createdAt.toString(),
                    style: const TextStyle(color: Colors.black),
                  ),
                  const SizedBox(height: 32.0),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Another fact'),
                  ),
                ],
              );
            } else if (state is CatFactsLoadingError) {
              return const Center(
                child: Text('Something went wrong!'),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
