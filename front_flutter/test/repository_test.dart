import 'package:flutter_test/flutter_test.dart';
import 'package:front_arquitetura_software/order/order_now_repository.dart';
import 'package:front_arquitetura_software/shared/models/order_model.dart';

void main() {
  test("Teste do DIO", () {
    var repository = OrderNowRepository();
    repository.finalizarCompra(OrderModel(
        nome: "café",
        id: 1,
        preco: 14,
        tamanho: 2,
        quantidade: 2,
        controleTemperatura: 1));
  });
}
