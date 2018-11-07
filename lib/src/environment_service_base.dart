// EnvironmentService handles the environment a Dart app runs within.
import 'dart:async';
import 'package:rxdart/rxdart.dart';

enum EnvironmentType { production, test, development }

class EnvironmentService {
  final BehaviorSubject _onDataChange =
      new BehaviorSubject<EnvironmentType>(seedValue: EnvironmentType.test);

  Observable get environmentUpdateStream => _onDataChange;

  EnvironmentType _activeEnvironment = EnvironmentType.test;

  EnvironmentType get activeEnvironment => _activeEnvironment;

  EnvironmentService();

  void setActiveEnvironment(EnvironmentType env) {
    this._activeEnvironment = env;
    _onDataChange.add(env);
  }
}
