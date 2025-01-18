// lib/bloc/movie_bloc.dart

import 'package:flutter_bloc/flutter_bloc.dart';
import 'movie_event.dart';
import 'movie_state.dart';
import '../data/repositories/movie_repository.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final MovieRepository movieRepository;

  MovieBloc(this.movieRepository) : super(MovieInitial()) {
    on<SearchMovie>((event, emit) async {
      emit(MovieLoading());
      try {
        final movies = await movieRepository.searchMovies(event.query, 1);
        if (movies.isEmpty) {
          emit(MovieEmpty());
        } else {
          emit(MovieLoaded(movies: movies, currentPage: 1, hasMore: movies.isNotEmpty));
        }
      } catch (e) {
        emit(MovieError('Failed to fetch movies'));
      }
    });

    on<LoadMoreMovies>((event, emit) async {
      if (state is MovieLoaded) {
        final currentState = state as MovieLoaded;
        try {
          final movies = await movieRepository.searchMovies(event.query, currentState.currentPage + 1);
          emit(MovieLoaded(
            movies: currentState.movies + movies,
            currentPage: currentState.currentPage + 1,
            hasMore: movies.isNotEmpty,
          ));
        } catch (e) {
          emit(MovieError('Failed to load more movies'));
        }
      }
    });
  }
}
