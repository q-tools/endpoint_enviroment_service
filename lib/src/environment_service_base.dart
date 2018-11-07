import 'package:rxdart/rxdart.dart';

enum EnvironmentType { production, test, development }

// EnvironmentService handles the environment a Dart app runs within.
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
