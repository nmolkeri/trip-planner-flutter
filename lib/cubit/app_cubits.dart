import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:trip_finder/cubit/app_cubit_state.dart';

import '../services/data_Services.dart';

class AppCubits extends Cubit<CubitStates> {
  
  //First initial state is done. 
  AppCubits({required this.data}) : super(InitialState()) {
    // After the initialization is done, we emit welcome state to provice data to observers. 
    emit(WelcomeState());
  }
  final DataServices data;
  late final places;

  void getData() {
    try {
      emit(LoadingState());
      // places = data.getInfo();
      sleep(const Duration(seconds: 1));
      emit(LoadedState());

    } catch(e) {
      print(e);
    }
  }

  void detailPage() {
    emit(DetailState());
  }
}