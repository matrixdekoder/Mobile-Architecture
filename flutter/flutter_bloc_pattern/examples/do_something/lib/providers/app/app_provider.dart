import 'package:do_something_app/providers/app/app_bloc.dart';
import 'package:flutter/material.dart';

class AppProvider extends InheritedWidget {
  final AppBloc appBloc;

  AppProvider({
    Key key,
    @required this.appBloc,
    Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static AppBloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(AppProvider) as AppProvider)
          .appBloc;
}
