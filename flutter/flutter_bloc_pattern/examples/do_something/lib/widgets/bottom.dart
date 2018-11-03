import 'package:do_something_app/resources/app_colors.dart';
import 'package:do_something_app/widgets/arc.dart';
import 'package:flutter/material.dart';

class Bottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = 64.0;
    final mediaQueryData = MediaQuery.of(context);
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Arc(
          size: Size(mediaQueryData.size.width, height),
        ),
        Padding(
          padding: EdgeInsets.only(left: 16.0,right: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.account_circle),
              Icon(Icons.more_vert),
            ],
          ),
        )
      ],
    );
  }
}
