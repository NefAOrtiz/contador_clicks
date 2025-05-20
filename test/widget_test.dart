import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:contador_clicks/main.dart';

void main() {
  testWidgets('El contador incrementa al presionar "Incrementar"', (WidgetTester tester) async {
    await tester.pumpWidget(const ContadorApp());

    // Verifica que comienza en 0 clicks
    expect(find.text('0 clicks'), findsOneWidget);

    // Toca el botón "Incrementar"
    await tester.tap(find.widgetWithText(ElevatedButton, 'Incrementar'));
    await tester.pump();

    // Verifica que ahora diga "1 click"
    expect(find.text('1 click'), findsOneWidget);
  });

  testWidgets('El contador no baja de 0', (WidgetTester tester) async {
    await tester.pumpWidget(const ContadorApp());

    // Presiona "Decrementar" sin haber incrementado
    await tester.tap(find.widgetWithText(ElevatedButton, 'Decrementar'));
    await tester.pump();

    // Aún debería mostrar 0
    expect(find.text('0 clicks'), findsOneWidget);
  });

  testWidgets('El contador se resetea a 0', (WidgetTester tester) async {
    await tester.pumpWidget(const ContadorApp());

    // Incrementar dos veces
    await tester.tap(find.widgetWithText(ElevatedButton, 'Incrementar'));
    await tester.pump();
    await tester.tap(find.widgetWithText(ElevatedButton, 'Incrementar'));
    await tester.pump();

    // Verificar que muestra 2
    expect(find.text('2 clicks'), findsOneWidget);

    // Presionar "Resetear"
    await tester.tap(find.widgetWithText(ElevatedButton, 'Resetear'));
    await tester.pump();

    // Verificar que vuelve a 0
    expect(find.text('0 clicks'), findsOneWidget);
  });
}
