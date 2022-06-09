import 'package:common/entity/usuario.dart';

abstract class UserServiceInterface {
  Future<List<Usuario>> listaUsuarios();
  Future<Usuario> buscaUsuario({required String uid});
  Future<void> inserirUsuario({required Usuario usuario});
}
