import 'package:equatable/equatable.dart';
import 'package:untitled/data/models/results.dart';

abstract class MovieDataState extends Equatable {
  const MovieDataState();
}

class MovieDataInitial extends MovieDataState {
  @override
  List<Object> get props => [];
}

class MovieDataLoaded extends MovieDataState {
  final List<Results> movieList;

  MovieDataLoaded({required this.movieList});

  @override
  List<Object?> get props => [movieList];
}

class MovieDataError extends MovieDataState {
  final String message;

  MovieDataError({required this.message});

  @override
  List<Object?> get props => [message];
}
