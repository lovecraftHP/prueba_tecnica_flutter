import 'package:coivd19/controllers/countryController.dart';
import 'package:coivd19/controllers/globalController.dart';
import 'package:get_it/get_it.dart';

import 'services/api.dart';

GetIt locator = GetIt.instance;
void setUpLocator() {
  locator.registerLazySingleton(() => Api());
  locator.registerLazySingleton(() => CountryController());
  locator.registerLazySingleton(() => GlobalController());
}
