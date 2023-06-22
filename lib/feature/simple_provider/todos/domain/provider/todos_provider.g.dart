// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todos_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$completedTodosHash() => r'36401d2da639451248e6d686d893ed2091dc59ff';

/// See also [completedTodos].
@ProviderFor(completedTodos)
final completedTodosProvider = AutoDisposeProvider<List<Todo>>.internal(
  completedTodos,
  name: r'completedTodosProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$completedTodosHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CompletedTodosRef = AutoDisposeProviderRef<List<Todo>>;
String _$todosHash() => r'bd9ae478774f23629dff3c92b44db593580d9d46';

/// See also [Todos].
@ProviderFor(Todos)
final todosProvider = AutoDisposeNotifierProvider<Todos, List<Todo>>.internal(
  Todos.new,
  name: r'todosProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$todosHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Todos = AutoDisposeNotifier<List<Todo>>;
String _$filterTodoOptionHash() => r'19b7946d07950b65717cb689b05908181715015f';

/// See also [FilterTodoOption].
@ProviderFor(FilterTodoOption)
final filterTodoOptionProvider =
    AutoDisposeNotifierProvider<FilterTodoOption, FilterTodo>.internal(
  FilterTodoOption.new,
  name: r'filterTodoOptionProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$filterTodoOptionHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FilterTodoOption = AutoDisposeNotifier<FilterTodo>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
