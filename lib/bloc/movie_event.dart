abstract class MovieEvent {}

class SearchMovie extends MovieEvent {
  final String query;

  SearchMovie(this.query);
}
