import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:network/client/client.dart';
import 'package:network/interceptors/log.dart';
import 'package:network/service/network.dart';
import 'package:network/service/network_interface.dart';

class NetworkModule implements ModuleInterface {
  @override
  List<SingleChildWidget> providers(InjectorInterface injector) {
    return [];
  }

  @override
  Future<void> registerServices(InjectorInterface injector) async {
    final client = DioClient();
    client.addInterceptors([Logging()]);
    injector.registerSingleton<NetworkInterface>(Network(client: client));
  }

  @override
  Map<String, WidgetBuilder> routes() {
    return {};
  }
}
