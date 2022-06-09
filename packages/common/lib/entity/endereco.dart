class Endereco {
  late String rua;
  late String cep;
  late String bairro;
  late String estado;
  late String cidade;
  late String complemento;

  Endereco(
      {required this.rua,
      required this.cep,
      required this.bairro,
      required this.estado,
      required this.cidade,
      String? complemento}) {
    this.complemento = complemento ?? '';
  }

  factory Endereco.fromJson({required Map<String, dynamic> json}) {
    return Endereco(
        rua: json['rua'],
        cep: json['cep'],
        bairro: json['bairro'],
        estado: json['estado'],
        cidade: json['cidade'],
        complemento: json['complemento']);
  }

  Map<String, dynamic> toJson() {
    final json = Map<String, dynamic>();
    json['rua'] = rua;
    json['cep'] = cep;
    json['bairro'] = bairro;
    json['estado'] = estado;
    json['cidade'] = cidade;
    json['complemento'] = complemento;
    return json;
  }
}
