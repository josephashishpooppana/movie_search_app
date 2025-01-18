// lib/bloc/movie_state.dart

import '../data/models/movie_model.dart';

abstract class MovieState {}

class MovieInitial extends MovieState {}

class MovieLoading extends MovieState {}

class MovieLoaded extends MovieState {
  final List<Movie> movies;
  final int currentPage;
  final bool hasMore;

  MovieLoaded({required this.movies, required this.currentPage, required this.hasMore});
}

class MovieError extends MovieState {
  final String message;

  MovieError(this.message);
}
