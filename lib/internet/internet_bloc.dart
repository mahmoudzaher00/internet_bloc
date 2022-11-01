import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';

part 'internet_event.dart';
part 'internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  StreamSubscription?streamSubscription;
  InternetBloc() : super(InternetInitial()) {
    on<InternetEvent>((event, emit) {
      if(event is ConnectedEvent){
        emit(InternetConnectedState(message: 'Connected'));

      }
      else if(event is NotConnectedEvent){
        emit(InternetNotConnectedState(message: 'Not Connected'));
      }
    });
    streamSubscription=Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if(result==ConnectivityResult.wifi||result==ConnectivityResult.mobile){
        add(ConnectedEvent());
      }else{
        add(NotConnectedEvent());
      }

    });
  }
  @override
  Future<void>close(){
    streamSubscription!.cancel();
    return super.close();
  }

}
