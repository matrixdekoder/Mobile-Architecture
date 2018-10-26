import 'package:flutter_bloc_pattern/data/repositories/DemoRepository.dart';
import 'package:flutter_bloc_pattern/features/demo/demo_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  test('DemoBloc', () {
    final demoBloc = DemoBloc(DemoRepository());
    demoBloc.localCount.last.then((value) => expect(value, 0));

    demoBloc.increase(1);
    demoBloc.localCount.last.then((value) => expect(value, 1));

    demoBloc.increase(2);
    demoBloc.localCount.last.then((value) => expect(value, 3));

  });
}
