
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/data/repositories/movies_repository.dart';

import 'movie_data_state.dart';

class MovieDataCubit extends Cubit<MovieDataState> {
  MovieDataCubit() : super(MovieDataInitial());

  final movieRepo = MoviesRepository();

  Future<void> getMovieData() async {
    try {
      var list = await movieRepo.fetchMovies();
      emit(MovieDataLoaded(movieList: list!));
    } catch (e) {
      emit(MovieDataError(message: e.toString()));
    }
  }
}
