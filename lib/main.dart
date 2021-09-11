import 'package:facebook_ui_task/app_cubit/cubit.dart';
import 'package:facebook_ui_task/app_cubit/states.dart';
import 'package:facebook_ui_task/home_layout/home_layout_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.grey[300],
              primaryColor: Colors.indigo,
              appBarTheme: AppBarTheme(
                color: Colors.white,
                elevation: 0.0,
              ),
              tabBarTheme: TabBarTheme(
                labelColor: Colors.indigo,
                unselectedLabelColor: Colors.grey,
              ),
            ),
            home: HomeLayoutScreen(),
          );
        },
      ),
    );
  }
}
