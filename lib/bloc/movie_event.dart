// lib/bloc/movie_event.dart

abstract class MovieEvent {}

class SearchMovie extends MovieEvent {
  final String query;

  SearchMovie(this.query);
}

class LoadMoreMovies extends MovieEvent {
  final String query;

  LoadMoreMovies(this.query);
}
