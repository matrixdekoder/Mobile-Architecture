import 'package:flutter/material.dart';

class AppContainer extends StatefulWidget {
  final Widget child;

  AppContainer({Key key, @required this.child}) : super(key: key);

  @override
  State<StatefulWidget> createState() => AppContainerState();
}

class AppContainerState extends State<AppContainer> {
  @override
  Widget build(BuildContext context) {
    return _InheritedAppContainerState(
      appContainerState: this,
      child: widget.child,
    );
  }
}

class _InheritedAppContainerState extends InheritedWidget {
  final AppContainerState appContainerState;

  _InheritedAppContainerState(
      {Key key, @required this.appContainerState, @required Widget child})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}
