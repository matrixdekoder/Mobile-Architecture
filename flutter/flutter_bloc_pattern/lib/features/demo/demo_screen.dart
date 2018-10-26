import 'package:flutter/material.dart';
import 'package:flutter_bloc_pattern/base_state.dart';
import 'package:flutter_bloc_pattern/features/demo/demo_bloc.dart';
import 'package:flutter_bloc_pattern/providers/app/app_bloc.dart';
import 'package:flutter_bloc_pattern/statics/routes.dart';

class DemoScreen extends StatefulWidget {
  final AppBloc appBloc;
  final DemoBloc demoBloc;

  const DemoScreen({Key key, @required this.demoBloc, @required this.appBloc})
      : super(key: key);

  @override
  _DemoScreenState createState() => _DemoScreenState();
}

class _DemoScreenState extends BaseState<DemoScreen> {

  AppBloc appBloc;

  @override
  void initState() {
    super.initState();
    appBloc = widget.appBloc;
    localBloc = widget.demoBloc;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(i18n.hello),
              StreamBuilder(
                stream: appBloc.globalCount,
                builder: (context, AsyncSnapshot<int> snapshot) {
                  print("build child Global");
                  return Text("Global State ${snapshot.data}");
                },
              ),
              RaisedButton(
                child: Text("Increase Global State"),
                onPressed: () => appBloc.increase(1),
              ),
              StreamBuilder(
                initialData: 0,
                stream: localBloc.localCount,
                builder: (context, AsyncSnapshot<int> snapshot) {
                  print("build child Local");
                  return Text("Local State ${snapshot.data}");
                },
              ),
              RaisedButton(
                child: Text("Increase Local State"),
                onPressed: () => localBloc.increase(1),
              ),
              RaisedButton(
                child: Text("Move"),
                onPressed: () => Navigator.pushNamed(context, Routes.next),
              )
            ],
          ),
        ),
      ),
    );
  }
}
