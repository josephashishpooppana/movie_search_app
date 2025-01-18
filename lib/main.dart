import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/movie_bloc.dart';
import 'data/repositories/movie_repository.dart';
import 'ui/movie_search_page.dart';
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
