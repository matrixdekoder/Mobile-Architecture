import 'package:flutter_bloc_pattern/providers/app/app_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  test('AppBloc', () {
    final appBloc = AppBloc();
    appBloc.globalCount.last.then((value) => expect(value, 0));

    appBloc.increase(1);
    appBloc.globalCount.last.then((value) => expect(value, 1));

    appBloc.increase(2);
    appBloc.globalCount.last.then((value) => expect(value, 3));

  });
}
