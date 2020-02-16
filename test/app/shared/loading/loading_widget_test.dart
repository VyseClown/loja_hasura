import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:loja_hasura/app/shared/loading/loading_widget.dart';

main() {
  testWidgets('LoadingWidget has message', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(LoadingWidget()));
    final textFinder = find.text('Loading');
    expect(textFinder, findsOneWidget);
  });
}
