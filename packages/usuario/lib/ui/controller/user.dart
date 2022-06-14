import 'package:common/common.dart';
import 'package:usuario/service/user_interface.dart';

class UserController extends BaseController {
  final UserServiceInterface userService;
  UserController({required this.userService});

  int _count = 0;
  int get count => _count;

  Future<void> add() async {
    setStatus(Status.loading);
    await Future.delayed(const Duration(seconds: 5));
    _count++;
    setStatus(Status.success);
  }

  Future<List<Usuario>> listaUsuarios() async {
    setStatus(Status.loading);
    final users = await userService.listaUsuarios();
    setStatus(Status.success);
    return users;
  }

  Future<Usuario> buscaUsuario({required String uid}) async {
    setStatus(Status.loading);
    try {
      final user = await userService.buscaUsuario(uid: uid);
      setStatus(Status.success);
      return user;
    } catch (error) {
      print(error);
      setStatus(Status.error);
      return Usuario(
          uid: '',
          nome: '',
          documento: '',
          senha: '',
          nascimento: DateTime.now());
    }
  }
}
