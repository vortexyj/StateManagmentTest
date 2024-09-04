part of 'testbloc_bloc.dart';

@immutable
abstract class TestblocEvent {}

class AddTaskEvent extends TestblocEvent {
  final String task;

  AddTaskEvent(this.task);
}

class RemoveTaskEvent extends TestblocEvent {
  final int index;

  RemoveTaskEvent(this.index);
}
