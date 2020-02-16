import 'package:flutter_test/flutter_test.dart';
import 'package:loja_hasura/app/modules/home/repositories/delete_produto_repository.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';


class MockClient extends Mock implements Dio {}

void main() {
  DeleteProdutoRepository repository;
  MockClient client;

  setUp(() {
    repository = DeleteProdutoRepository(null);
    client = MockClient();
  });

  group('DeleteProdutoRepositoryRepository Test', () {
    test("First Test", () {
      expect(repository, isInstanceOf<DeleteProdutoRepository>());
    });

    test('returns a Post if the http call completes successfully', () async {
      when(client.get('https://jsonplaceholder.typicode.com/posts/1'))
          .thenAnswer(
              (_) async => Response(data: {'title': 'Test'}, statusCode: 200));
      Map<String, dynamic> data = await repository.fetchPost(client);
      expect(data['title'], 'Test');
    });
  });
}
