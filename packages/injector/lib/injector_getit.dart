import 'package:get_it/get_it.dart';

import 'injector_interface.dart';

class InjectorGetIt implements InjectorInterface {
  static final InjectorGetIt _instance = InjectorGetIt._();
  static InjectorGetIt get instance => _instance;
  late GetIt _getIt;

  InjectorGetIt._() {
    _getIt = GetIt.instance;
  }

  @override
  T get<T extends Object>() {
    return _getIt.get<T>();
  }

  @override
  void registerLazySingleton<T extends Object>(T instance) {
    _getIt.registerLazySingleton<T>(() => instance);
  }

  @override
  void registerSingleton<T extends Object>(T instance) {
    _getIt.registerSingleton<T>(instance);
  }
}
