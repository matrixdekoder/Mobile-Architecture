import 'package:flutter_bloc_pattern/base_bloc.dart';
import 'package:flutter_bloc_pattern/data/repositories/DemoRepository.dart';

class DemoBloc implements BaseBloc {
  final DemoRepository demoRepository;

  DemoBloc(this.demoRepository);

  @override
  dispose() {
    // TODO: implement dispose
  }
}
