import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';

class DeleteProdutoRepository extends Disposable {
  final HasuraConnect _hasuraConnect;

  DeleteProdutoRepository(this._hasuraConnect);

  Future<bool> deleteProduto({String idProduto}) async {
    try {
      var mutation = r''' 
          mutation delete_produto($idProduto:uuid!) {
            delete_produto(where: {id: {_eq: $idProduto}}) {
              affected_rows
            }
          }
      ''';

      var snapshot = await _hasuraConnect.mutation(mutation, variables: {
        "idProduto": idProduto,
      });

      return snapshot["data"]["delete_produto"]["affected_rows"] > 0;
    } catch (e) {
      return false;
    }
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
