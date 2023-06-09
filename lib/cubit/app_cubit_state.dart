import 'package:equatable/equatable.dart';
import 'package:trip_finder/model/data_model.dart';

abstract class CubitStates extends Equatable {

}

//Every app that uses cubit should have one initial state. 
class InitialState extends CubitStates {
  @override
  // TODO: implement props
  List<Object> get props => [];

}

class WelcomeState extends CubitStates {
  @override
  // TODO: implement props
  List<Object> get props => [];

}

class LoadingState extends CubitStates {
  @override
  // TODO: implement props
  List<Object> get props => [];

}

class LoadedState extends CubitStates {
  @override
  // TODO: implement props
  List<Object> get props => [];

}

class DetailState extends CubitStates {
  @override
  // TODO: implement props
  List<Object> get props => [];

}