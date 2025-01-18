import 'package:flutter_bloc/flutter_bloc.dart';
import 'movie_event.dart';
import 'movie_state.dart';
import '../data/repositories/movie_repository.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final MovieRepository movieRepository;

  MovieBloc(this.movieRepository) : super(MovieInitial()) {
    // Register the event handler for SearchMovie
    on<SearchMovie>((event, emit) async {
      emit(MovieLoading());
      try {
        final movies = await movieRepository.searchMovies(event.query);
        emit(MovieLoaded(movies));
      } catch (e) {
        emit(MovieError('Failed to fetch movies'));
      }
    });
  }
}
