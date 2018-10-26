import 'dart:async';

import 'package:flutter_bloc_pattern/base_bloc.dart';
import 'package:rxdart/rxdart.dart';

class AppBloc implements BaseBloc {

  final _countSubject = BehaviorSubject<int>(seedValue: 0);

  Stream<int> get globalCount => _countSubject.stream;
  get increase => _increase;

  _increase(int number) {
    _countSubject.value += number;
    _countSubject.sink.add(_countSubject.value);
  }

  void dispose() {
    print("dispose local");
    _countSubject.close();
  }
}