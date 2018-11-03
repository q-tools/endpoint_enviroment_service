// EnvironmentService handles the environment a Dart app runs within.
import 'dart:async';
import 'package:rxdart/rxdart.dart';

enum EnvironmentType { production, test, development }

class EnvironmentService {
  final BehaviorSubject _onDataChange =
      new BehaviorSubject<EnvironmentType>(seedValue: EnvironmentType.test);
  Observable get enviromentUpdateStream => _onDataChange;

  EnvironmentType _activeEnviroment = EnvironmentType.test;
  EnvironmentType get activeEnviroment => _activeEnviroment;

  EnvironmentService();

  void setActiveEnviroment(EnvironmentType env) {
    this._activeEnviroment = env;
    _onDataChange.add(env);
  }
}
