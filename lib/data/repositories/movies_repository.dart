import 'package:dio/dio.dart';
import 'package:untitled/data/models/movie_model.dart';
import 'package:untitled/data/models/results.dart';

class MoviesRepository {
  List<Results>? movieList;
  Dio dio = Dio();

  Future<List<Results>>? fetchMovies() async {
    final response = await dio.get(
        "https://api.themoviedb.org/3/discover/movie?api_key=bbe62cd9dc8d28c5145b7e276c5ce617&page=1");
    if (response.statusCode == 200) {
        var movieModel = MoviesModel.fromJson(response.data);
        movieList = movieModel.results;
        return movieList!;
    }
    return movieList!;
  }
}
