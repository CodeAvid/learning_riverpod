import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

import '../../data/todo.dart';

part 'todos_provider.g.dart';

@riverpod
class Todos extends _$Todos {
  @override
  List<Todo> build() {
    return _filterList();
  }

  final _list = [
    Todo(
      id: const Uuid().v4(),
      description: 'Send a build to fizido',
      isCompleted: true,
    ),
    Todo(
      id: const Uuid().v4(),
      description: 'Upload a new build for auditbar',
    ),
    Todo(
      id: const Uuid().v4(),
      description: 'Resolve some ticket available for TellerOne',
    ),
    Todo(
      id: const Uuid().v4(),
      description: 'Send proposal to MainStreet ',
      isCompleted: true,
    ),
    Todo(
      id: const Uuid().v4(),
      description: 'Read more about riverpod',
      isCompleted: true,
    ),
    Todo(
      id: const Uuid().v4(),
      description: 'Slide the plantain to eat',
    ),
  ];
  addTodo(Todo todo) {
    state = [todo, ...state];
  }

  removeTodo(Todo passedTodo) {
    state.removeWhere((todo) => passedTodo.id == todo.id);
  }

  markHasCompleted(Todo passedTodo) {
    final Todo result = state.firstWhere((todo) => passedTodo.id == todo.id);
    result.isCompleted = true;
  }

  List<Todo> _filterList() {
    final selectedOption = ref.watch(filterTodoOptionProvider);
    switch (selectedOption) {
      case FilterTodo.all:
        return _list;
      case FilterTodo.completed:
        return _list.where((todo) => todo.isCompleted).toList();
      case FilterTodo.outstanding:
        return _list.where((todo) => !todo.isCompleted).toList();
    }
  }
}

@riverpod
List<Todo> completedTodos(CompletedTodosRef ref) {
  final List<Todo> todos = ref.watch(todosProvider);
  return todos.where((todo) => todo.isCompleted).toList();
}

@riverpod
class FilterTodoOption extends _$FilterTodoOption {
  @override
  FilterTodo build() {
    return FilterTodo.all;
  }

  update(FilterTodo selectedFilter) {
    state = selectedFilter;
  }
}
