import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_finder/cubit/app_cubit_state.dart';
import 'package:trip_finder/cubit/app_cubits.dart';
import 'package:trip_finder/pages/details_page.dart';
import 'package:trip_finder/pages/home_page.dart';
import 'package:trip_finder/pages/welcome_page.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({super.key});

  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
          builder: (context, state) {
            switch (state) {
              case WelcomeState:
                return WelcomePage();
              case LoadedState:
                return HomePage();
              case DetailState:
                return DetailsPage();
              case LoadingState:
                return Center(child: CircularProgressIndicator());
            }
            return Container();
          } 
        ),
    );
  }
}