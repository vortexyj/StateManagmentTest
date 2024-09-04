import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:statemangmenttest1/presentation/model/bloc/testbloc_bloc.dart';

class StateTaster extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 12.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration:
                          const InputDecoration(labelText: 'Enter task'),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      final task = _controller.text;
                      if (task.isNotEmpty) {
                        context.read<TestblocBloc>().add(AddTaskEvent(task));
                        _controller.clear();
                      }
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: BlocBuilder<TestblocBloc, TestblocState>(
                builder: (context, state) {
                  if (state is TestblocSuccess) {
                    return ListView.builder(
                      itemCount: state.task.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(state.task[index]),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              context
                                  .read<TestblocBloc>()
                                  .add(RemoveTaskEvent(index));
                            },
                          ),
                        );
                      },
                    );
                  } else if (state is TestblocFailure) {
                    return Center(child: Text(state.err));
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
