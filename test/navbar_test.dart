import 'package:cosy_pos/widgets/navbar/nav_item.dart';
import 'package:cosy_pos/widgets/navbar/user.dart';
import 'package:cosy_pos/main.dart';
import 'package:flutter/services.dart';

import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(WidgetTester tester) async {
    final flamante = rootBundle.load('assets/fonts/Roboto-Regular.ttf');
    final fontLoader = FontLoader('Roboto')..addFont(flamante);
    await fontLoader.load();

    const width = 834.0;
    const height = 1194.0;

    tester.binding.window.devicePixelRatioTestValue = 1.0;
    final dpi = tester.binding.window.devicePixelRatio;

    tester.binding.window.physicalSizeTestValue =
        Size(width * dpi, height * dpi);
  }

  testWidgets('Menu items test', (WidgetTester tester) async {
    await setUp(tester);
    await tester.pumpWidget(const MyApp());

    expect(find.widgetWithText(NavItem, 'Reservation'), findsOneWidget);
    expect(find.widgetWithText(NavItem, 'Table services'), findsOneWidget);
    expect(find.widgetWithText(NavItem, 'Menu'), findsOneWidget);
    expect(find.widgetWithText(NavItem, 'Delivery'), findsOneWidget);
    expect(find.widgetWithText(NavItem, 'Accounting'), findsOneWidget);
  });

  // testWidgets('User test', (WidgetTester tester) async {
  //   await setUp(tester);
  //   await tester.pumpWidget(const MyApp());

  //   expect(find.widgetWithText(User, 'Leslie K.'), findsOneWidget);
  //   expect(find.widgetWithText(User, 'Cameron W.'), findsOneWidget);
  //   expect(find.widgetWithText(User, 'Jacob J.'), findsOneWidget);
  // });
}
