import 'package:enviroment_service/enviroment_service.dart';
import 'dart:async';

EnvironmentService environmentService = new EnvironmentService();

main() {
  // Listen for Enviroment changes, gets the default
  var envUpdated = environmentService.enviromentUpdateStream;

  envUpdated.listen((env) => print('Active env: ${env}'));

  // Update the enviroment
  environmentService.setActiveEnviroment(EnvironmentType.production);

  // Wait 3 seconds then listen for Enviroment changes, gets only the update.
  Timer(Duration(seconds: 3), () {
    envUpdated.listen((env) => print('Active env: ${env}'));
  });

  new Future.delayed(new Duration(seconds: 10));
}
