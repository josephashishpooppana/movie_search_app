// lib/main.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_search_app/bloc/movie_bloc.dart';
import 'package:movie_search_app/data/repositories/movie_repository.dart';
import 'package:movie_search_app/ui/movie_search_page.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  final MovieRepository movieRepository = MovieRepository();
  runApp(MyApp(movieRepository: movieRepository));
}

class MyApp extends StatelessWidget {
  final MovieRepository movieRepository;

  MyApp({required this.movieRepository});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Search App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: BlocProvider(
        create: (context) => MovieBloc(movieRepository),
        child: MovieSearchPage(),
      ),
    );
  }
}
