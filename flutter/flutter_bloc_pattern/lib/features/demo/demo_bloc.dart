import 'dart:async';

import 'package:flutter_bloc_pattern/base_bloc.dart';
import 'package:flutter_bloc_pattern/data/repositories/DemoRepository.dart';
import 'package:rxdart/rxdart.dart';

class DemoBloc implements BaseBloc {
  final _countSubject = BehaviorSubject<int>(seedValue: 0);
  final DemoRepository demoRepository;


  DemoBloc(this.demoRepository);

  Stream<int> get localCount => _countSubject.stream;
  get increase => _increase;

  _increase(int number) {
    _countSubject.value += number;
  }

  void dispose() {
    print("dispose local");
    _countSubject.close();
  }
}
