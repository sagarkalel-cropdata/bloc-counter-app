import 'package:bloc_counter_app/bloc/counter_bloc.dart';
import 'package:bloc_counter_app/cubit/counter_cubit.dart';
import 'package:bloc_counter_app/cubit/switch_cubit.dart';
import 'package:bloc_counter_app/view/my_home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => CounterCubit(SwitchCubit(), CounterBloc())),
          BlocProvider(create: (context) => SwitchCubit()),
          BlocProvider(create: (context) => CounterBloc()),
        ],
        child: const MyHomePage(title: "This is demo bloc and cubit app"),
      ),
    );
  }
}
