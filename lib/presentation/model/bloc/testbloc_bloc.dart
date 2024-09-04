import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'testbloc_event.dart';
part 'testbloc_state.dart';

class TestblocBloc extends Bloc<TestblocEvent, TestblocState> {
  TestblocBloc() : super(TestblocInitial()) {
    on<TestblocEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<AddTaskEvent>((event, emit) => addtask(event, emit));
    on<RemoveTaskEvent>((event, emit) => removeTask(event, emit));
  }
  List<String> tasks = [];
  void addtask(AddTaskEvent event, Emitter<TestblocState> emit) {
    if (event.task.isEmpty) {
      emit(TestblocFailure('Task cannot be empty'));
      return;
    }
    try {
      tasks.add(event.task);
      emit(TestblocSuccess(List.from(tasks)));
    } catch (error) {
      emit(TestblocFailure('Failed to add task'));
    }
  }

  void removeTask(RemoveTaskEvent event, Emitter<TestblocState> emit) {
    try {
      tasks.removeAt(event.index);
      emit(TestblocSuccess(List.from(tasks)));
    } catch (error) {
      emit(TestblocFailure('Failed to load tasks'));
    }
  }
}
