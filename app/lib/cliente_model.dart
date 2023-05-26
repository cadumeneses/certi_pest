class ClienteModel {
  final String id;
  final String nome;
  final String rua;
  final String numero;
  final String bairro;
  final String cidade;
  final String estado;
  final String ambiente;
  final String cnpj;

  ClienteModel({
    required this.id,
    required this.nome,
    required this.rua,
    required this.numero,
    required this.bairro,
    required this.cidade,
    required this.estado,
    required this.ambiente,
    required this.cnpj,
  });
}
