part of 'main.dart';


///
///Init all the dependancy of the project in the container
///
Future setupDependency(bool withAsync) async {
  _initializeInjectionDependency(true);
}

void _initializeInjectionDependency(bool lazylly) {

  Get.lazyPut<MasterController>(() => MasterController(), fenix: true);
  Get.lazyPut<AppRoutes>(() => AppRoutes(), fenix: true);
  Get.lazyPut<MomoImages>(() => MomoImages(), fenix: true);
  Get.lazyPut<MomoIcons>(() => MomoIcons(), fenix: true);
  Get.put<Config>(Config(), permanent: true);

}

void disposeDependency() {
  Get.deleteAll(force: true);
}