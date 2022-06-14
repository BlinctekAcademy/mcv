import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:network/network.dart';
import 'package:usuario/usuario.dart';
import 'package:random/random.dart';
import 'dart:math' as math;

void main() async {
  final moduleManager = await _setup();
  runApp(MyApp(moduleManager: moduleManager));
}

Future<ModuleManagerInterface> _setup() async {
  final ModuleManagerInterface moduleManager = ModuleManager();
  await moduleManager
      .registerModules([NetworkModule(), UsuarioModule(), RandomModule()]);
  return moduleManager;
}

class MyApp extends StatelessWidget {
  MyApp({Key? key, required this.moduleManager}) : super(key: key);
  final ModuleManagerInterface moduleManager;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: moduleManager.providers,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: moduleManager.routes,
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controller = TextEditingController(text: 'Valor inicial');
  final _random = math.Random();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.aux,
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.all(Spacing.x2),
                  child: PrimaryInput(
                    onChanged: (String value) {
                      print(value);
                    },
                  )),
              Expanded(child: Container()),
              Padding(
                padding: EdgeInsets.all(Spacing.x2),
                child: PrimaryButton(
                  text: 'Navegar',
                  onPressed: () async {
                    Navigator.of(context).pushNamed(Routes.welcomePage);
                    /*try {
                      var usuarios = await UserService.instance.listaUsuarios();
                      print(usuarios);
                    } catch (error) {
                      print(error);
                    }*/
                  },
                  disabledColor: Colors.grey,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(Spacing.x2),
                child: PrimaryButton(
                  text: 'Usuário',
                  onPressed: () async {
                    Navigator.of(context).pushNamed(Routes.userPage);
                    /*try {
                      var usuarios = await UserService.instance.listaUsuarios();
                      print(usuarios);
                    } catch (error) {
                      print(error);
                    }*/
                  },
                  disabledColor: Colors.grey,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(Spacing.x2),
                child: PrimaryButton(
                  text: 'Número Aleatório',
                  onPressed: () {
                    Navigator.of(context).pushNamed(Routes.randomPage);
                  },
                  disabledColor: Colors.grey,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(Spacing.x2),
                child: PrimaryButton(
                  text: 'Sync',
                  onPressed: () {
                    context.read<RandomController>().randomInt();
                    for (var i = 0; i < 5; i++) {
                      _sync(i);
                      print('Pressed $i');
                    }
                  },
                  disabledColor: Colors.grey,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(Spacing.x2),
                child: PrimaryButton(
                  text: 'Async',
                  onPressed: () async {
                    var futures = <Future>[];
                    for (var i = 0; i < 5; i++) {
                      futures.add(_async(i));
                      print('Pressed $i');
                    }
                    futures.add(_randomInt());
                    final result = await Future.wait(futures);
                    result.forEach((res) {
                      print(res);
                    });
                    print('Done...');
                  },
                  disabledColor: Colors.grey,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(Spacing.x2),
                child: PrimaryButton(
                  text: 'Async2',
                  onPressed: () async {
                    print(await _async2(874));
                  },
                  disabledColor: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _sync(int i) {
    print('Done $i...');
  }

  Future<String> _async(int i) async {
    final sleep = _random.nextInt(10);
    print('$i -> $sleep');
    await Future.delayed(Duration(seconds: sleep));
    return 'Done $i...';
  }

  Future<String> _async2(int i) async {
    final sleep = _random.nextInt(2000);
    print('$i -> $sleep');
    await Future.delayed(Duration(milliseconds: sleep));
    return 'Done $i...';
  }

  Future<int> _randomInt() async {
    final rand = _random.nextInt(1000001);
    return rand;
  }
}
