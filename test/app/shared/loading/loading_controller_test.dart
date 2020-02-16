import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:loja_hasura/app/shared/loading/loading_controller.dart';
import 'package:loja_hasura/app/app_module.dart';

void main() {
  initModule(AppModule());
  LoadingController loading;

  setUp(() {
    loading = AppModule.to.get<LoadingController>();
  });

  group('LoadingController Test', () {
    test("First Test", () {
      expect(loading, isInstanceOf<LoadingController>());
    });

    test("Set Value", () {
      expect(loading.value, equals(0));
      loading.increment();
      expect(loading.value, equals(1));
    });
  });
}
