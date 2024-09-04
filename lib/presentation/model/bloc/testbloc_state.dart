part of 'testbloc_bloc.dart';

@immutable
sealed class TestblocState {}

final class TestblocInitial extends TestblocState {}

final class TestblocSuccess extends TestblocState {
  final List<String> task;

  TestblocSuccess(this.task);
}

final class TestblocFailure extends TestblocState {
  final String err;

  TestblocFailure(this.err);
}
