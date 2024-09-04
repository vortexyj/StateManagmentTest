import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RiverpodState extends StateNotifier<List<String>> {
  RiverpodState() : super([]);

  void addTask(String task) {
    state = [...state, task];
  }

  void removeTask(int index) {
    state = [
      for (int i = 0; i < state.length; i++)
        if (i != index) state[i]
    ];
  }
}

final taskProvider = StateNotifierProvider<RiverpodState, List<String>>((ref) {
  return RiverpodState();
});
