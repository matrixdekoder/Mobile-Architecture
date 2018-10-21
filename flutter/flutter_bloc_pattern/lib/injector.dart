import 'package:flutter/material.dart';
import 'package:flutter_bloc_pattern/data/repositories/DemoRepository.dart';

class Injector extends InheritedWidget {
  final DemoRepository demoRepository;

  Injector({Key key, @required this.demoRepository, @required Widget child})
      : super(key: key, child: child);

  static Injector of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(Injector);

  @override
  bool updateShouldNotify(Injector oldWidget) =>
      demoRepository != oldWidget.demoRepository;
}
