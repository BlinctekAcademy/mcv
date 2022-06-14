import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:network/network.dart';
import 'package:random/service/random.dart';
import 'package:random/service/random_interface.dart';
import 'package:random/ui/controllers/random.dart';
import 'package:random/ui/pages/random.dart';

class RandomModule implements ModuleInterface {
  @override
  List<SingleChildWidget> providers(InjectorInterface injector) {
    return [
      ChangeNotifierProvider(
          create: (context) =>
              RandomController(service: injector.get<RandomInterface>()))
    ];
  }

  @override
  Future<void> registerServices(InjectorInterface injector) async {
    injector.registerLazySingleton<RandomInterface>(
        RandomService(network: injector.get<NetworkInterface>()));
  }

  @override
  Map<String, WidgetBuilder> routes() {
    return {Routes.randomPage: (_) => RandomPage()};
  }
}
