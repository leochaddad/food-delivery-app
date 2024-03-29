import 'package:flutter/material.dart';
import 'package:front_arquitetura_software/shared/models/coffee_model.dart';
import 'package:front_arquitetura_software/shared/models/informacoes_nutricionais_model.dart';
import 'package:front_arquitetura_software/shared/models/ingredients_model.dart';

class HomeRepository {
  final List<CoffeeModel> listCoffeeModel = [
    CoffeeModel(
        nome: "Caffé Misto",
        descricao: "Café com leite devidamente preparado por profissionais",
        preco: 4.99,
        id: 1,
        imagem: "assets/twocup.png",
        tempoPreparacao: 5,
        ingredientes: [
          Ingredients(
              color: Colors.pink.shade400,
              ingrediente: "Water",
              icon: Icons.water),
          Ingredients(
              color: Colors.blue, ingrediente: "Sugar", icon: Icons.food_bank),
          Ingredients(
              color: Colors.brown.shade400,
              ingrediente: "Coffee",
              icon: Icons.coffee),
        ],
        informacoesNutricionais: InformacoesNutricionaisModel(
            calorias: 250, cafeina: 150, proteinas: 10)),
    CoffeeModel(
        nome: "Cappuccino",
        descricao: "Café com leite devidamente preparado por profissionais",
        preco: 12.99,
        id: 2,
        imagem: "assets/twocup.png",
        tempoPreparacao: 15,
        ingredientes: [
          Ingredients(
              color: Colors.pink.shade400,
              ingrediente: "Water",
              icon: Icons.water),
          Ingredients(
              color: Colors.blue, ingrediente: "Sugar", icon: Icons.food_bank),
          Ingredients(
              color: Colors.brown.shade400,
              ingrediente: "Cappuccino",
              icon: Icons.time_to_leave),
          Ingredients(
              color: Colors.black54, ingrediente: "Coffee", icon: Icons.coffee),
        ],
        informacoesNutricionais: InformacoesNutricionaisModel(
            calorias: 12, cafeina: 12, proteinas: 12)),
    CoffeeModel(
        nome: "Cappuccino com leite",
        descricao: "Café com leite devidamente preparado por profissionais",
        preco: 12.99,
        id: 3,
        imagem: "assets/twocup.png",
        tempoPreparacao: 45,
        ingredientes: [
          Ingredients(
              color: Colors.pink.shade400,
              ingrediente: "Water",
              icon: Icons.water),
          Ingredients(
              color: Colors.blue, ingrediente: "Sugar", icon: Icons.food_bank),
          Ingredients(
              color: Colors.grey.shade400,
              ingrediente: "Milk",
              icon: Icons.coffee_outlined),
          Ingredients(
              color: Colors.brown.shade400,
              ingrediente: "Coffee",
              icon: Icons.coffee),
        ],
        informacoesNutricionais: InformacoesNutricionaisModel(
            calorias: 12000, cafeina: 139, proteinas: 1000)),
  ];

  List<CoffeeModel> getCoffeeList() {
    return listCoffeeModel;
  }
}
