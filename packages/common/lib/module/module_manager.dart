import 'package:common/common.dart';
import 'package:flutter/material.dart';

class ModuleManager implements ModuleManagerInterface {
  final Map<String, WidgetBuilder> _routes = {};
  final List<SingleChildWidget> _providers = [];
  final InjectorInterface _injector = InjectorGetIt.instance;

  @override
  List<SingleChildWidget> get providers => _providers;

  @override
  Future<void> registerModules(List<ModuleInterface> modules) async {
    for (final module in modules) {
      await module.registerServices(_injector);

      _providers.addAll(module.providers(_injector));

      _routes.addAll(module.routes());
    }
  }

  @override
  Map<String, WidgetBuilder> get routes => _routes;
}
