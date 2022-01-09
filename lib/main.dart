import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutubi_assignment/cubits/screen1/screen1_cubit.dart';
import 'package:tutubi_assignment/cubits/screen2/screen2_cubit.dart';
import 'package:tutubi_assignment/views/my_launch_page.dart';
import 'package:tutubi_assignment/views/screen1_page.dart';
import 'package:tutubi_assignment/views/screen2_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Screen1Cubit(),
      child: BlocProvider(
        create: (context) => Screen2Cubit(),
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const MyLaunchPage(
            title: 'Tutubi Assingment',
          ),
          routes: {
            'screen1': (context) => const Screen1Page(),
            'screen2': (context) => const Screen2Page()
          },
        ),
      ),
    );
  }
}
