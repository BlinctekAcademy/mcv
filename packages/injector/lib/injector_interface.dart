abstract class InjectorInterface {
  void registerSingleton<T extends Object>(T instance);
  void registerLazySingleton<T extends Object>(T instance);
  T get<T extends Object>();
}
