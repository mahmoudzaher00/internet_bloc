import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_bloc/internet/internet_bloc.dart';

class HomePageBloc extends StatelessWidget {
  const HomePageBloc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        //TODO:Bloc
        child: BlocConsumer<InternetBloc, InternetState>(
          listener: (context, state){
            if (state is InternetNotConnectedState){
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text(state.message),
                    backgroundColor: Colors.red,
                )
              );
            }
          },
          builder: (context, state) {
            if(state is InternetConnectedState){
              return Text(state.message);
            }else if(state is InternetNotConnectedState){
              return Text(state.message);
            }
            else{
              return const Text('Initial');
            }
          },
        ),

      ),
    );
  }
}
