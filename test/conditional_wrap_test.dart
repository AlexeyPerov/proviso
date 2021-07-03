import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:proviso/proviso.dart';

void main() {
  testWidgets('ConditionalWrap should wrap child if condition == true',
      (WidgetTester tester) async {
    final GlobalKey childKey = GlobalKey();
    final GlobalKey parentKey = GlobalKey();

    Widget buildWithCondition(bool condition) {
      return MaterialApp(
        home: Material(
          child: Center(
            child: ConditionalWrap(
              shouldWrap: condition,
              child: Container(key: childKey),
              parentBuilder: (child) => Container(
                key: parentKey,
                child: child,
              ),
            ),
          ),
        ),
      );
    }

    await tester.pumpWidget(
      buildWithCondition(true),
    );

    Finder childFinder = find.byKey(childKey);
    expect(childFinder, findsOneWidget);

    Finder parentFinder = find.byKey(parentKey);
    expect(parentFinder, findsOneWidget);

    await tester.pumpWidget(
      buildWithCondition(false),
    );

    childFinder = find.byKey(childKey);
    expect(childFinder, findsOneWidget);

    parentFinder = find.byKey(parentKey);
    expect(parentFinder, findsNothing);
  });

  testWidgets(
      'ConditionalWrap should NOT wrap child fallback if condition == false',
      (WidgetTester tester) async {
    final GlobalKey childKey = GlobalKey();
    final GlobalKey parentKey = GlobalKey();

    Widget buildWithCondition(bool condition) {
      return MaterialApp(
        home: Material(
          child: Center(
            child: ConditionalWrap(
              shouldWrap: condition,
              child: Container(key: childKey),
              parentBuilder: (child) => Container(
                key: parentKey,
                child: child,
              ),
            ),
          ),
        ),
      );
    }

    await tester.pumpWidget(
      buildWithCondition(false),
    );

    Finder childFinder = find.byKey(childKey);
    expect(childFinder, findsOneWidget);

    Finder parentFinder = find.byKey(parentKey);
    expect(parentFinder, findsNothing);
  });
}
