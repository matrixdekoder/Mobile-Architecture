import 'package:do_something_app/resources/app_colors.dart';
import 'package:flutter/material.dart';

class AppFloatingActionButton extends StatelessWidget {
  final onPressed;

  const AppFloatingActionButton({Key key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.main,
      borderRadius: BorderRadius.all(Radius.circular((64.0 - 8) / 2)),
      child: InkWell(
        onTap: () {
          print("OK");
        },
        borderRadius: BorderRadius.all(Radius.circular((64.0 - 8) / 2)),
        child: Container(
          width: 64.0 - 14,
          height: 64.0 - 14,
          child: Icon(
            Icons.add,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}