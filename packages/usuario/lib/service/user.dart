import 'package:common/entity/usuario.dart';
import 'package:network/network.dart';
import 'package:usuario/service/user_interface.dart';

class UserService implements UserServiceInterface {
  final NetworkInterface network;

  UserService({required this.network});

  @override
  Future<List<Usuario>> listaUsuarios() async {
    var response = await network.get(url: 'usuario');
    var usuarios = <Usuario>[];
    response.data['usuarios'].forEach((element) {
      var usuario = Usuario.fromJson(json: element);
      usuarios.add(usuario);
    });
    return usuarios;
  }

  @override
  Future<Usuario> buscaUsuario({required String uid}) async {
    var response = await network.get(url: 'usuario/$uid');
    var usuario = Usuario.fromJson(json: response.data['usuario']);
    return usuario;
  }

  @override
  Future<void> inserirUsuario({required Usuario usuario}) async {
    await network.post(url: 'usuario', body: usuario.toJson());
  }
}
