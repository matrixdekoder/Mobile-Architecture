import 'package:flutter/material.dart';
import 'package:flutter_bloc_pattern/generated/i18n.dart';

class BaseState<T extends StatefulWidget> extends State<T> {
  var localBloc;
  S i18n;

  @override
  Widget build(BuildContext context) {
    i18n = S.of(context);
    // TODO: implement build
  }

  @override
  void dispose() {
    if (localBloc != null) localBloc.dispose();
    super.dispose();
  }
}
