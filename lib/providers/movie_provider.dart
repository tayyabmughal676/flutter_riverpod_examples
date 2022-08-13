// Creating Notifier
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/movie.dart';
import '../services/movie_service.dart';

part 'movie_provider.freezed.dart';

// Creating state where the freezed annotation will suggest that boilerplate code needs to be generated
@freezed
abstract class MovieState with _$MovieState {
  const factory MovieState({
    @Default([]) List<Movie> movies,
    @Default(true) bool isLoading,
  }) = _MovieState;

  const MovieState._();
}

// Creating state notifier provider
final moviesProvider =
    StateNotifierProvider<MovieNotifier, MovieState>((ref) => MovieNotifier());

class MovieNotifier extends StateNotifier<MovieState> {
  // Notifier constructor - call functions on provider initialization
  MovieNotifier() : super(const MovieState()) {
    loadMovies();
  }

  // Simple loadMovies functions that will load json file from data folder
  loadMovies() async {
    state = state.copyWith(isLoading: true);
    final moviesList = await MovieService().fetchMovies();
    // Convert list to list of movies using the movie class constructor
    final movies = moviesList.map((e) => Movie.fromJson(e)).toList();
    // Update state in provider
    state = state.copyWith(movies: movies, isLoading: false);
  }

  filterMovies(filter) async {
    state = state.copyWith(isLoading: true);
    final moviesList = await MovieService().fetchMovies();
    // Convert list to list of movies using the movie class constructor with simple filter title function inside
    final movies = moviesList
        .map((e) => Movie.fromJson(e))
        .toList()
        .where((element) =>
            element.title!.toLowerCase().contains(filter.toLowerCase()))
        .toList();

    state = state.copyWith(movies: movies, isLoading: false);
  }
}
