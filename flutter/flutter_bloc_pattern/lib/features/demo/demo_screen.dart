import 'package:flutter/material.dart';
import 'package:flutter_bloc_pattern/base_state.dart';
import 'package:flutter_bloc_pattern/features/demo/demo_bloc.dart';
import 'package:flutter_bloc_pattern/providers/app/app_bloc.dart';

class DemoScreen extends StatefulWidget {
  final AppBloc appBloc;
  final DemoBloc demoBloc;

  const DemoScreen({Key key, @required this.demoBloc, @required this.appBloc})
      : super(key: key);

  @override
  _DemoScreenState createState() => _DemoScreenState();
}

class _DemoScreenState extends BaseState<DemoScreen> {
  @override
  void initState() {
    super.initState();
    localBloc = widget.demoBloc;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Center(
        child: Text("Hello"),
      ),
    );
  }
}
