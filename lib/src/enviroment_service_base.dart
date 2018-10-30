// EnvironmentService handles the environment a Dart app runs within.
import 'dart:async';
import 'package:rxdart/rxdart.dart';

enum EnvironmentType { production, test, development }

class EnvironmentService {
  final onDataChange =
      new BehaviorSubject<EnvironmentType>(seedValue: EnvironmentType.test);
  EnvironmentType _activeEnviroment = EnvironmentType.test;

  EnvironmentService();

  EnvironmentType get activeEnviroment => _activeEnviroment;

  void setActiveEnviroment(EnvironmentType env) {
    this._activeEnviroment = env;
    onDataChange.add(env);
  }
}
