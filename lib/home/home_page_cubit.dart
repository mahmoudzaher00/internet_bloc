import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/internet_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:  Center(




        //TODO: cubit
        child: BlocBuilder<InternetCubit, InternetState>(
          builder: (context, state) {
            if(state is InternetConnectedState) {
              return  Text(state.message,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),);
            }else if(state is InternetNotConnectedState){
              return  Text(state.message,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),);
            }else{
             return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
