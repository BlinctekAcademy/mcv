import 'package:common/common.dart';
import '../../service/random_interface.dart';

class RandomController extends BaseController {
  final RandomInterface service;
  int _number = 0;

  RandomController({required this.service});

  int get number => _number;

  Future<void> randomInt() async {
    setStatus(Status.loading);
    _number = await service.randomInt();
    print('Finalizado...');
    setStatus(Status.success);
  }
} 