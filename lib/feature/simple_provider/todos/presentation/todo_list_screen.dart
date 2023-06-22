import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learning_riverpod/feature/simple_provider/todos/data/todo.dart';
import 'package:learning_riverpod/feature/simple_provider/todos/domain/provider/todos_provider.dart';
import 'package:uuid/uuid.dart';

class TodoListScreen extends ConsumerWidget {
  const TodoListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Todo> todos = ref.watch(todosProvider);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addTodo(context),
        child: const Icon(
          Icons.add,
        ),
      ),
      appBar: AppBar(
        title: const Text('Todos'),
        actions: [
          DropdownButton<FilterTodo>(
            alignment: AlignmentDirectional.centerEnd,
            value: ref.watch(filterTodoOptionProvider),
            onChanged: (value) => ref
                .read(filterTodoOptionProvider.notifier)
                .update(value ?? FilterTodo.all),
            items: const [
              DropdownMenuItem(
                value: FilterTodo.all,
                child: Text('all'),
              ),
              DropdownMenuItem(
                value: FilterTodo.completed,
                child: Text('completed'),
              ),
              DropdownMenuItem(
                value: FilterTodo.outstanding,
                child: Text('Outstanding'),
              ),
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: ListView.builder(
          padding: const EdgeInsets.all(20),
          itemCount: todos.length,
          itemBuilder: (context, index) {
            final Todo todo = todos[index];
            return Card(
              color: todo.isCompleted ? Colors.green : Colors.grey,
              child: ListTile(
                title: Text(
                  (todo.description),
                  style: TextStyle(
                    color: todo.isCompleted ? Colors.white : null,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _addTodo(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                20,
              ),
            ),
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: const AddTodoWidget(),
          ),
        );
      },
    );
  }
}

class AddTodoWidget extends HookConsumerWidget {
  const AddTodoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoTextController = useTextEditingController();
    final todoFocusNode = useFocusNode();
    final formKey = GlobalKey<FormState>();

    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Add Todo',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: todoTextController,
              focusNode: todoFocusNode,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'enter a todo';
                }
                return null;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                horizontal: 60,
                vertical: 14,
              )),
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  final newTodo = Todo(
                    id: const Uuid().v4(),
                    description: todoTextController.text,
                  );
                  ref.read(todosProvider.notifier).addTodo(newTodo);
                  Navigator.pop(context);
                }
              },
              child: const Text('Add'),
            )
          ],
        ),
      ),
    );
  }
}
