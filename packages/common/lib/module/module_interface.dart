import 'package:common/common.dart';
import 'package:flutter/material.dart';

abstract class ModuleInterface {
  Map<String, WidgetBuilder> routes();
  Future<void> registerServices(InjectorInterface injector);
  List<SingleChildWidget> providers(InjectorInterface injector);
}
