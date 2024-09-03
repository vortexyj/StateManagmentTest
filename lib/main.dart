import 'package:flutter/material.dart';
import 'package:statemangmenttest1/presentation/views/mainview.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StateTaster(),
    );
  }
}
