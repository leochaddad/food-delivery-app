import 'package:flutter/material.dart';
import 'package:front_arquitetura_software/home/widgets/appbar_widget.dart';
import 'package:front_arquitetura_software/home/widgets/card_coffee_widget.dart';

import 'home_controller.dart';
import 'widgets/card_imagem_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController controller = HomeController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: ListView(children: [
        Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Sabor da semana",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 2),
          Container(
            height: 400,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return CardCoffeeWidget(
                  descricao: controller.lista[index].descricao,
                  imagem: controller.lista[index].imagem,
                  nome: controller.lista[index].nome,
                  preco: controller.lista[index].preco,
                  id: controller.lista[index].id,
                  tempoPreparacao: controller.lista[index].tempoPreparacao,
                  ingredientes: controller.lista[index].ingredientes,
                  informacoesNutricionais:
                      controller.lista[index].informacoesNutricionais,
                );
              },
              itemCount: controller.lista.length,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    "Veja algumas fotos",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          Container(
            height: MediaQuery.of(context).size.height * 0.28,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Row(
                  children: [
                    CardImagemWidget(imagem: "assets/coffee.jpg"),
                    CardImagemWidget(imagem: "assets/coffee2.jpg"),
                    CardImagemWidget(imagem: "assets/coffee3.jpg"),
                  ],
                ),
              ],
            ),
          ),
        ]),
      ]),
    );
  }
}
