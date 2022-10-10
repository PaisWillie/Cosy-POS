import 'package:cosy_pos/widgets/navbar/nav_item.dart';
import 'package:cosy_pos/widgets/navbar/user.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:cosy_pos/main.dart';

void main() {
  testWidgets('Menu items test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.widgetWithText(NavItem, 'Reservation'), findsOneWidget);
    expect(find.widgetWithText(NavItem, 'Table services'), findsOneWidget);
    expect(find.widgetWithText(NavItem, 'Menu'), findsOneWidget);
    expect(find.widgetWithText(NavItem, 'Delivery'), findsOneWidget);
    expect(find.widgetWithText(NavItem, 'Accounting'), findsOneWidget);
  });

  testWidgets('User test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.widgetWithText(User, 'Leslie K.'), findsOneWidget);
    expect(find.widgetWithText(User, 'Cameron W.'), findsOneWidget);
    expect(find.widgetWithText(User, 'Jacob J.'), findsOneWidget);
  });
}
