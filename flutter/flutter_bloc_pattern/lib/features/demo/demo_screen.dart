import 'package:flutter/material.dart';
import 'package:flutter_bloc_pattern/features/demo/demo_bloc.dart';
import 'package:flutter_bloc_pattern/generated/i18n.dart';
import 'package:flutter_bloc_pattern/providers/app/app_bloc.dart';
import 'package:flutter_bloc_pattern/statics/routes.dart';

class DemoScreen extends StatefulWidget {
  final S i18n;
  final AppBloc appBloc;
  final DemoBloc demoBloc;

  const DemoScreen({Key key, @required this.demoBloc, @required this.appBloc, this.i18n})
      : super(key: key);

  @override
  _DemoScreenState createState() => _DemoScreenState();
}

class _DemoScreenState extends State<DemoScreen> {
  S i18n;
  AppBloc appBloc;
  DemoBloc demoBloc;

  @override
  void initState() {
    super.initState();
    i18n = widget.i18n;
    appBloc = widget.appBloc;
    demoBloc = widget.demoBloc;
  }

  @override
  Widget build(BuildContext context) {
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
                stream: demoBloc.localCount,
                builder: (context, AsyncSnapshot<int> snapshot) {
                  print("build child Local");
                  return Text("Local State ${snapshot.data}");
                },
              ),
              RaisedButton(
                child: Text("Increase Local State"),
                onPressed: () => demoBloc.increase(1),
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

  @override
  void dispose() {
    demoBloc?.dispose();
    super.dispose();
  }


}
