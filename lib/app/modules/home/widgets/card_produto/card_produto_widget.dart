import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:loja_hasura/app/modules/home/widgets/card_produto/card_produto_controller.dart';

class CardProdutoWidget extends StatefulWidget {
  final String nomeProduto;
  final String categoriaProduto;
  final String tipoProduto;
  final String valor;
  final String idProduto;

  const CardProdutoWidget(
      {Key key,
      @required this.nomeProduto,
      @required this.categoriaProduto,
      @required this.tipoProduto,
      @required this.valor,
      @required this.idProduto})
      : super(key: key);

  @override
  _CardProdutoWidgetState createState() => _CardProdutoWidgetState();
}

class _CardProdutoWidgetState extends ModularState<CardProdutoWidget, CardProdutoController> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Modular.to.pushNamed('/home/UpdateProduto/${widget.idProduto}');
      },
      onLongPress: () {
        showDialog(
            context: context,
            child: AlertDialog(
              content:Text("Deseja excluir o item?"),
              actions: <Widget>[
                FlatButton(
                  child: Text("Sim"),
                  onPressed: () {
                    controller.deleteProduto(widget.idProduto);
                    Modular.to.pop();
                  },
                ),
                FlatButton(
                  child: Text("Nao"),
                  onPressed: () {
                    Modular.to.pop();
                  },
                )
              ],
            ));
      },
      child: AnimatedCard(
        direction: AnimatedCardDirection.left, //Initial animation direction
        initDelay: Duration(milliseconds: 0), //Delay to initial animation
        duration: Duration(milliseconds: 500), //Initial animation duration
        child: Card(
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 50,
                right: -50,
                child: CircleAvatar(
                  radius: 130,
                  backgroundColor:
                      Theme.of(context).primaryColor.withOpacity(.4),
                ),
              ),
              Positioned(
                top: 100,
                right: 50,
                child: CircleAvatar(
                  radius: 130,
                  backgroundColor:
                      Theme.of(context).primaryColor.withOpacity(.3),
                ),
              ),
              Positioned(
                top: 120,
                right: 150,
                child: CircleAvatar(
                  radius: 130,
                  backgroundColor:
                      Theme.of(context).primaryColor.withOpacity(.1),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(widget.nomeProduto,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Text(widget.categoriaProduto,
                        style: TextStyle(color: Colors.black, fontSize: 18)),
                    Row(
                      children: <Widget>[
                        Expanded(
                            child: Text(widget.tipoProduto,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18))),
                        Text(
                          "R\$ ${double.parse(widget.valor).toStringAsFixed(2).replaceAll('.', ',')}",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
