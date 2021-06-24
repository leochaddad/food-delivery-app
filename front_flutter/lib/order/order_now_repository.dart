import 'package:dio/dio.dart';
import 'package:front_arquitetura_software/shared/models/order_model.dart';

class OrderNowRepository {
  Dio dio = Dio();

  Future<void> finalizarCompra(OrderModel obj) async {
    try {
      print(obj.toJson());
      await dio.post('URL', data: obj.toJson());
    } on DioError catch (e) {
      print('Erro ao realizar post ${e.error}');
    }
  }
}
