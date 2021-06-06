import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/presentation/router/app_router.dart';
import 'package:untitled/utility/app_bloc_observer.dart';
import 'logic/cubits/movie_data_cubit.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<MovieDataCubit>(
            create: (context) => MovieDataCubit(),
          ),
        ],
        child: MaterialApp(
          title: 'My Movies',
          theme: ThemeData(),
          onGenerateRoute: AppRouter().onGenerateRoute,
        ));
  }
}
