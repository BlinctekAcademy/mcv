import 'package:common/entity/endereco.dart';

class Usuario {
  late String uid;
  late String nome;
  late String documento;
  late String senha;
  late DateTime nascimento;
  late List<Endereco> enderecos;

  Usuario(
      {required this.uid,
      required this.nome,
      required this.documento,
      required this.senha,
      required this.nascimento,
      List<Endereco>? enderecos}) {
    this.enderecos = enderecos ?? <Endereco>[];
  }

  factory Usuario.fromJson({required Map<String, dynamic> json}) {
    final enderecos = <Endereco>[];
    json['enderecos'].forEach((element) {
      final endereco = Endereco.fromJson(json: element);
      enderecos.add(endereco);
    });
    return Usuario(
        uid: json['uid'],
        nome: json['nome'],
        documento: json['documento'],
        senha: json['senha'],
        nascimento: DateTime.parse(json['nascimento']),
        enderecos: enderecos);
  }

  Map<String, dynamic> toJson() {
    final json = Map<String, dynamic>();
    json['nome'] = nome;
    return json;
  }
}
