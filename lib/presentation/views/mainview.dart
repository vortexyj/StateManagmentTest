import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemangmenttest1/presentation/model/state.dart';

class StateTaster extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<ProviderState>(context);
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
                        taskProvider.addTask(
                            task); // بنضيف المهمة باستخدام الـ Provider
                        _controller.clear();
                      }
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: taskProvider.tasks.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(taskProvider.tasks[index]),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => taskProvider.removeTask(index),
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
