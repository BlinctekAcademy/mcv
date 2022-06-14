import 'package:network/network.dart';
import 'package:random/service/random_interface.dart';
import 'dart:math';

class RandomService implements RandomInterface {
  final NetworkInterface network;
  final Random _random = Random();

  RandomService({required this.network});

  @override
  Future<int> randomInt() async {
    var sleep = _random.nextInt(7);
    sleep++;
    await Future.delayed(Duration(seconds: sleep));
    final result = _random.nextInt(1000);
    return result;
  }
}
