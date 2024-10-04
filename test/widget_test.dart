import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mi_elsalvador/main.dart'; // Importa tu archivo principal.

void main() {
  testWidgets('Navegación entre pantallas en el menú inferior', (WidgetTester tester) async {
    // Construye la app y activa un frame.
    await tester.pumpWidget(MyApp());

    // Verifica que la pantalla inicial sea la de Home.
    expect(find.text('Bienvenido a la sección Home'), findsOneWidget);
    expect(find.text('Aquí se mostrará el mapa'), findsNothing);
    expect(find.text('Lista de favoritos'), findsNothing);
    expect(find.text('Información de los creadores'), findsNothing);

    // Toca el ícono del mapa y actualiza la interfaz.
    await tester.tap(find.byIcon(Icons.map));
    await tester.pump();  // Re-renderiza la UI después de la interacción.

    // Verifica que la pantalla del mapa esté visible.
    expect(find.text('Aquí se mostrará el mapa'), findsOneWidget);
    expect(find.text('Bienvenido a la sección Home'), findsNothing);

    // Toca el ícono de favoritos y actualiza la interfaz.
    await tester.tap(find.byIcon(Icons.favorite));
    await tester.pump();  // Re-renderiza la UI después de la interacción.

    // Verifica que la pantalla de favoritos esté visible.
    expect(find.text('Lista de favoritos'), findsOneWidget);
    expect(find.text('Aquí se mostrará el mapa'), findsNothing);

    // Toca el ícono de créditos y actualiza la interfaz.
    await tester.tap(find.byIcon(Icons.info));
    await tester.pump();  // Re-renderiza la UI después de la interacción.

    // Verifica que la pantalla de créditos esté visible.
    expect(find.text('Información de los creadores'), findsOneWidget);
    expect(find.text('Lista de favoritos'), findsNothing);
  });
}
