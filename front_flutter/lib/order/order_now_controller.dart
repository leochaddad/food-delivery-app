import 'package:front_arquitetura_software/order/order_now_repository.dart';
import 'package:front_arquitetura_software/shared/models/order_model.dart';
import 'package:mobx/mobx.dart';

part 'order_now_controller.g.dart';

class OrderNowController = OrderNowControllerBase with _$OrderNowController;

abstract class OrderNowControllerBase with Store {
  OrderNowControllerBase(
      {required this.preco, required this.nome, required this.id});

  final String nome;
  final int id;

  @observable
  int quantidade = 1;

  @observable
  int tamanho = 1;

  @observable
  double preco = 0;

  @observable
  int controleTemperatura = 0;

  @computed
  double get precoTotal =>
      double.parse((preco * quantidade).toStringAsFixed(2));

  @action
  void trocaTemperatura(int value) => controleTemperatura = value;

  @action
  void trocaValor(int value) => tamanho = value;

  @action
  void trocaPreco(double valor) => preco = valor;

  @action
  void menosQuantidade() => quantidade < 0 ? quantidade = 0 : quantidade--;

  @action
  void maisQuantidade() => quantidade++;

  final OrderNowRepository repository = OrderNowRepository();

  Future<void> finalizarCadastro() async {
    var orderModel = OrderModel(
        nome: nome,
        id: id,
        preco: precoTotal,
        tamanho: tamanho,
        quantidade: quantidade,
        controleTemperatura: controleTemperatura);

    await repository.finalizarCompra(orderModel);
  }
}
