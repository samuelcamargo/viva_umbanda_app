// Teste básico do app Viva Umbanda.
// Garante que o MaterialApp sobe e que a Home exibe o título.

import 'package:flutter_test/flutter_test.dart';

import 'package:viva_umbanda/app_root.dart';

void main() {
  testWidgets('App inicia e exibe título Viva Umbanda', (WidgetTester tester) async {
    await tester.pumpWidget(buildRootApp());
    await tester.pumpAndSettle();

    expect(find.text('Viva Umbanda'), findsOneWidget);
  });
}
