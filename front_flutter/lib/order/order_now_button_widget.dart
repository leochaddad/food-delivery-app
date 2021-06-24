import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'order_now_controller.dart';

class OrderNowButtonWidget extends StatefulWidget {
  final double preco;
  final String nome;
  final int id;
  const OrderNowButtonWidget({
    Key? key,
    required this.preco,
    required this.nome,
    required this.id,
  }) : super(key: key);

  @override
  _OrderNowButtonWidgetState createState() => _OrderNowButtonWidgetState();
}

class _OrderNowButtonWidgetState extends State<OrderNowButtonWidget> {
  @override
  Widget build(BuildContext context) {
    final controller = OrderNowController(
        preco: widget.preco, id: widget.id, nome: widget.nome);
    return Container(
        width: MediaQuery.of(context).size.width * 1,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.083,
          decoration: BoxDecoration(
              color: Color(0xFF473D3A),
              borderRadius: BorderRadius.circular(30)),
          child: TextButton(
            onPressed: () {
              buildShowModalBottomSheet(context, controller);
            },
            child: Text(
              "Compre agora",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
        ));
  }

  Future<dynamic> buildShowModalBottomSheet(
      BuildContext context, OrderNowController controller) {
    return showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40))),
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.4,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(right: 8, top: 4),
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    icon: Icon(
                      Icons.close,
                      size: 25,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                Container(
                    decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: 1.0, color: Colors.grey.shade300)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          right: 16, left: 24, bottom: 16),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 4),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Temperatura",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF473D3A),
                                      fontSize: 15),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Text(
                                    "Quantidade",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF473D3A),
                                        fontSize: 15),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Observer(
                                builder: (_) => Container(
                                  child: CupertinoSlidingSegmentedControl(
                                    groupValue: controller.controleTemperatura,
                                    backgroundColor: Color(0xFFDAB68C),
                                    children: const <int, Widget>{
                                      0: Icon(Icons.whatshot),
                                      1: Icon(Icons.ac_unit),
                                    },
                                    onValueChanged: (int? value) {
                                      controller.trocaTemperatura(value!);
                                    },
                                  ),
                                ),
                              ),
                              Container(
                                child: Observer(
                                  builder: (_) => Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Color(0xFFDAB68C),
                                            borderRadius:
                                                BorderRadius.circular(100)),
                                        child: IconButton(
                                          color: Colors.white,
                                          icon: Icon(Icons.remove, size: 20),
                                          onPressed: controller.quantidade <= 1
                                              ? null
                                              : controller.menosQuantidade,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8),
                                        child: Container(
                                          child: Text(
                                            "${controller.quantidade}",
                                            style: TextStyle(fontSize: 20),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Color(0xFFDAB68C),
                                            borderRadius:
                                                BorderRadius.circular(100)),
                                        child: IconButton(
                                          color: Colors.white,
                                          icon: Icon(Icons.add, size: 20),
                                          onPressed: () {
                                            controller.maisQuantidade();
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    )),
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            width: 1.0, color: Colors.grey.shade300)),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
                    child: Container(
                      padding: EdgeInsets.only(left: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Select size",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF473D3A),
                                  fontSize: 15)),
                          Padding(
                            padding: const EdgeInsets.only(right: 28),
                            child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.only(left: 10),
                              width: 80,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(10)),
                              child: DropdownButtonHideUnderline(
                                child: Observer(
                                  builder: (_) => DropdownButton<int>(
                                      value: controller.tamanho,
                                      items: [
                                        DropdownMenuItem(
                                          child: Text("P"),
                                          value: 1,
                                        ),
                                        DropdownMenuItem(
                                          child: Text("M"),
                                          value: 2,
                                        ),
                                        DropdownMenuItem(
                                            child: Text("G"), value: 3),
                                        DropdownMenuItem(
                                            child: Text("GG"), value: 4)
                                      ],
                                      onChanged: (value) {
                                        controller.trocaValor(value!);
                                      }),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Total",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF473D3A),
                                    fontSize: 18)),
                            Observer(
                              builder: (_) => Text(
                                  "\$ ${controller.precoTotal}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFFDAB68C),
                                      fontSize: 24)),
                            )
                          ],
                        ),
                        Container(
                            height: 57,
                            width: 220,
                            decoration: BoxDecoration(
                                color: Color(0xFF473D3A),
                                borderRadius: BorderRadius.circular(30)),
                            child: TextButton(
                              onPressed: () async {
                                await controller.finalizarCadastro();
                                Navigator.pop(context);
                                Navigator.pop(context);
                              },
                              child: Text(
                                "Compre agora",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ))
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        });
      },
    );
  }
}
