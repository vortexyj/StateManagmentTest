import 'package:flutter/material.dart';
import 'package:statemangmenttest1/presentation/model/state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StateTaster extends ConsumerWidget {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final task = ref.watch(taskProvider);
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
                        // Step 4: Use ref.read to interact with the provider's notifier
                        ref
                            .read(taskProvider.notifier)
                            .addTask(task); // Adding a task
                        _controller.clear();
                      }
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: task.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(task[index]),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        ref.read(taskProvider.notifier).removeTask(index);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
