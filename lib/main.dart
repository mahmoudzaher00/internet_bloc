import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_bloc/cubit/internet_cubit.dart';
import 'package:internet_bloc/home/home_page_bloc.dart';
import 'package:internet_bloc/internet/internet_bloc.dart';

import 'home/home_page_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        //TODO:Internet check bloc
        BlocProvider<InternetBloc>(create: (context)=>InternetBloc())

        //TODO:Internet check cubit
        // BlocProvider<InternetCubit>(create: (BuildContext context) => InternetCubit()..checkConnection()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:  const HomePageBloc(),
      ),
    );
  }
}

