import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:proviso/proviso.dart';

void main() {
  testWidgets(
    'SafeBuilder should call widgetBuilder if there is no error',
        (WidgetTester tester) async {
      final Widget validWidget = Container();
      final Widget fallbackWidget = Container();
      await tester.pumpWidget(
        Builder(
          builder: (BuildContext context) {
            return SafeBuilder(
              widgetBuilder: (_) => validWidget,
              fallbackBuilder: (e, _) => fallbackWidget,
            );
          },
        ),
      );

      expect(find.byWidget(validWidget), findsOneWidget);
      expect(find.byWidget(fallbackWidget), findsNothing);
    },
  );

  testWidgets(
    'SafeBuilder should call fallbackWidget if there is an error',
        (WidgetTester tester) async {
      final Widget fallbackWidget = Container();
      await tester.pumpWidget(
        Builder(
          builder: (BuildContext context) {
            return SafeBuilder(
              widgetBuilder: (_) => throw "test",
              fallbackBuilder: (e, _) => fallbackWidget,
            );
          },
        ),
      );

      expect(find.byWidget(fallbackWidget), findsOneWidget);
    },
  );
}