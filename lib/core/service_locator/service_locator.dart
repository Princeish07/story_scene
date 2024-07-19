
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:story_scene/core/api_service/api_service.dart';
import 'package:story_scene/data/repository/login_repository_impl.dart';
import 'package:story_scene/data/repository/story_repository_impl.dart';
import 'package:story_scene/domain/repository/login_repository.dart';
import 'package:story_scene/domain/repository/story_repository.dart';
import 'package:story_scene/presentation/ui/login/provider/login_provider.dart';
import 'package:story_scene/presentation/ui/scene/provider/scene_provider.dart';
import 'package:story_scene/presentation/ui/stats/provider/stats_provider.dart';
import 'package:story_scene/presentation/ui/story/provider/story_provider.dart';

import '../shared_pref/shared_preference.dart';

final serviceLocator = GetIt.instance; // GetIt.I is also valid
void serviceLocatorSetup() {
  registerRepository();
  registerOther();

}

registerRepository() {
  serviceLocator.registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl());
  serviceLocator.registerLazySingleton<StoryRepository>(() => StoryRepositoryImpl());


}


List<SingleChildWidget> getProviders() {
  return [
    // Register your providers here
    ChangeNotifierProvider<LoginProvider>(
      create: (_) => LoginProvider(repository: serviceLocator()),
    ),
    ChangeNotifierProvider<StoryProvider>(
      create: (_) => StoryProvider(storyRepository: serviceLocator()),
    ),
    ChangeNotifierProvider<SceneProvider>(
      create: (_) => SceneProvider(),
    ),
    ChangeNotifierProvider<StatsProvider>(
      create: (_) => StatsProvider(),
    ),
  ];
}

registerOther() {
  serviceLocator.registerLazySingleton<ApiService>(() => ApiService());
  serviceLocator.registerLazySingleton<PreferenceUtils>(() => PreferenceUtils());



}
