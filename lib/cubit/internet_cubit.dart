import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  InternetCubit() : super(InternetInitial());
  StreamSubscription?streamSubscription;
  void connected(){
    emit(InternetConnectedState(message: 'connected'));

  }
  void notConnected(){
    emit(InternetNotConnectedState(message: 'Not connected'));
  }
  void checkConnection(){
    streamSubscription=Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if(result==ConnectivityResult.wifi||result==ConnectivityResult.mobile){
        connected();
      }else {
        notConnected();
      }

    });
  }
  @override
  Future<void>close(){
    streamSubscription!.cancel();
    return super.close();
  }
}
