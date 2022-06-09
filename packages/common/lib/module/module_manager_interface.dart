import 'package:common/common.dart';
import 'package:flutter/material.dart';

import 'module_interface.dart';

abstract class ModuleManagerInterface {
  Future<void> registerModules(List<ModuleInterface> modules);
  Map<String, WidgetBuilder> get routes;
  List<SingleChildWidget> get providers;
}
