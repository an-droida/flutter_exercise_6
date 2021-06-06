import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/logic/cubits/movie_data_cubit.dart';
import 'package:untitled/logic/cubits/movie_data_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Movies App")),
      ),
      body: BlocConsumer<MovieDataCubit, MovieDataState>(
        listener: (context, state) {
          if (state is MovieDataError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is MovieDataInitial) {
            BlocProvider.of<MovieDataCubit>(context).getMovieData();
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is MovieDataLoaded) {
            return ListView.builder(
              itemBuilder: (context, index) {
                var movies = state.movieList[index];
                return GestureDetector(
                  onTap: () {
                    print(movies.id);
                    Navigator.of(context).pushNamed('/details-screen',
                        arguments: movies);
                  },
                  child: Container(
                    padding: EdgeInsets.only(left: 70.0,top: 20.0,right: 70.0,bottom: 10.0),
                    child: Card(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 250,
                            width: double.infinity,
                            child: Image.network(
                                "https://image.tmdb.org/t/p/original" +
                                    movies.posterPath!),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              movies.title!,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount: state.movieList.length,
            );
          } else {
            return Center(
              child: Text('Ops! Something went wrong!'),
            );
          }
        },
      ),
    );
  }
}
