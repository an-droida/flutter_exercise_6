import 'package:flutter/material.dart';
import 'package:untitled/data/models/results.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key, required this.movie}) : super(key: key);
  final Results movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title!),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Image.network(
                  "https://image.tmdb.org/t/p/original" + movie.posterPath!),
              SizedBox(
                height: 20,
              ),
              Text(
                movie.title!,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("IMBD",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  Text(movie.voteAverage.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      )),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(movie.releaseDate.toString()),
              SizedBox(
                height: 10,
              ),
              Container(
                  padding: EdgeInsets.all(20), child: Text(movie.overview!)),
            ],
          ),
        ),
      ),
    );
  }
}
