class OrderModel {
  final String nome;
  final int id;
  final double preco;
  final int tamanho;
  final int quantidade;
  final int controleTemperatura;

  OrderModel(
      {required this.nome,
      required this.id,
      required this.preco,
      required this.tamanho,
      required this.quantidade,
      required this.controleTemperatura});

  Map<String, dynamic> toJson() => <String, dynamic>{
        'nome': nome,
        'id': id,
        'preco': preco,
        'tamanho': tamanho,
        'quantidade': quantidade,
        'temperatura': controleTemperatura
      };
}
