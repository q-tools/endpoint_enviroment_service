import 'package:environment_service/environment_service.dart';
import 'dart:async';

EnvironmentService environmentService = new EnvironmentService();

main() {
  // Listen for Environment changes, gets the default
  var envUpdated = environmentService.environmentUpdateStream;

  envUpdated.listen((env) => print('Active env: ${env}'));

  // Update the environment
  environmentService.setActiveEnvironment(EnvironmentType.production);

  // Wait 3 seconds then listen for Environment changes, gets only the update.
  Timer(Duration(seconds: 3), () {
    envUpdated.listen((env) => print('Active env: ${env}'));
  });

  new Future.delayed(new Duration(seconds: 10));
}
