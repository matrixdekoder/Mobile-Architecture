import 'package:do_something_app/providers/todo/todo_bloc.dart';
import 'package:flutter/material.dart';

class TodoProvider extends InheritedWidget {
  final TodoBloc todoBloc;

  TodoProvider({
    Key key,
    @required this.todoBloc,
    Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static TodoBloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(TodoProvider) as TodoProvider)
          .todoBloc;
}
