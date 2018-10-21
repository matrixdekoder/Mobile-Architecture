import 'package:flutter/material.dart';
import 'package:flutter_bloc_pattern/providers/app/app_bloc.dart';

class AppProvider extends StatefulWidget {
  final AppBloc appBloc;
  final Widget child;

  const AppProvider({Key key, this.appBloc, this.child}) : super(key: key);

  @override
  _AppProviderState createState() => _AppProviderState();

  static AppBloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(_AppProviderInherited)
              as _AppProviderInherited)
          .appBloc;
}

class _AppProviderState extends State<AppProvider> {
  @override
  Widget build(BuildContext context) => _AppProviderInherited(
        appBloc: widget.appBloc,
        child: widget.child,
      );

  @override
  void dispose() {
    widget.appBloc.dispose();
    super.dispose();
  }
}

class _AppProviderInherited extends InheritedWidget {
  final AppBloc appBloc;

  _AppProviderInherited({Key key, this.appBloc, Widget child})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(_AppProviderInherited oldWidget) =>
      appBloc != oldWidget.appBloc;
}
