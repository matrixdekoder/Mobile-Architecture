import 'package:do_something_app/widgets/app_floating_action_button.dart';
import 'package:do_something_app/widgets/bottom.dart';
import 'package:do_something_app/widgets/test.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
          body: SafeArea(
            child: Container(
              child: Column(
                children: <Widget>[
                  Expanded(child: Text("AAA")),
                  ArcTest(
                    size: Size(100.0, 100.0),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Bottom(),
        ),
        Positioned(
          left: 0.0,
          right: 0.0,
          bottom: 64.0/2+14/2,
          child: Center(
            child: AppFloatingActionButton(
              onPressed: () {},
            ),
          ),
        )
      ],
    );
  }
}
