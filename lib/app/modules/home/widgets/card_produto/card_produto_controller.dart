import 'package:loja_hasura/app/modules/home/repositories/delete_produto_repository.dart';
import 'package:mobx/mobx.dart';

part 'card_produto_controller.g.dart';

class CardProdutoController = _CardProdutoBase with _$CardProdutoController;

abstract class _CardProdutoBase with Store {
  final DeleteProdutoRepository repository;

  _CardProdutoBase(this.repository);

  @action
  Future<bool> deleteProduto(String idProduto) async {
    var result = await repository.deleteProduto(idProduto: idProduto);
    return result;
  }
}
