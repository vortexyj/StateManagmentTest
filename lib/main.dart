import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemangmenttest1/presentation/model/state.dart';
import 'package:statemangmenttest1/presentation/views/mainview.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProviderState(),
      child: MaterialApp(
        home: StateTaster(),
      ),
    );
  }
}
