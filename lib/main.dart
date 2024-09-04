import 'package:flutter/material.dart';
import 'package:statemangmenttest1/presentation/model/bloc/testbloc_bloc.dart';
import 'package:statemangmenttest1/presentation/views/mainview.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => TestblocBloc(),
        child: StateTaster(),
      ),
    );
  }
}
