import 'package:flutter_starter_template/core/di/setup_for_cubits.dart';
import 'package:flutter_starter_template/core/di/setup_for_repos.dart';
import 'package:flutter_starter_template/core/di/setup_for_services.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupAllDependencies() async {
  await SetupForServices.setupForServices();
  SetupForRepos.setupForRepos();
  SetupForCubits.setUpForCubits();
}
