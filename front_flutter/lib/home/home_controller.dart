import 'package:front_arquitetura_software/shared/models/coffee_model.dart';

import 'home_repository.dart';

class HomeController {
  List<CoffeeModel> lista = [];

  final repository = HomeRepository();
  HomeController() {
    getCafe();
  }

  getCafe() {
    lista = repository.getCoffeeList();
  }
}
