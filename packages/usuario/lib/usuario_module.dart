import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:network/network.dart';
import 'package:usuario/service/user.dart';
import 'package:usuario/ui/controller/user.dart';
import 'package:usuario/ui/page/user.dart';

import 'service/user_interface.dart';

class UsuarioModule implements ModuleInterface {
  @override
  List<SingleChildWidget> providers(InjectorInterface injector) {
    return [
      ChangeNotifierProvider(
          create: (context) =>
              UserController(userService: injector.get<UserServiceInterface>()))
    ];
  }

  @override
  Future<void> registerServices(InjectorInterface injector) async {
    injector.registerSingleton<UserServiceInterface>(
        UserService(network: injector.get<NetworkInterface>()));
  }

  @override
  Map<String, WidgetBuilder> routes() {
    return {Routes.userPage: (_) => UserPage()};
  }
}
