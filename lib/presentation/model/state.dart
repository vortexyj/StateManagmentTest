import 'package:flutter/material.dart';

class ProviderState with ChangeNotifier {
  List<String> tasks = [];
  void addTask(String task) {
    tasks.add(task);
    notifyListeners();
  }

  void removeTask(int index) {
    tasks.removeAt(index);
    notifyListeners();
  }
}
