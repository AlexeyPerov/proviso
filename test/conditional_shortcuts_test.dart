import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:proviso/proviso.dart';

void main() {
  testWidgets(
    'ConditionBuilder should call trueBuilder if condition == true',
    (WidgetTester tester) async {
      final Widget trueWidget = Container();
      final Widget fallbackWidget = Container();
      await tester.pumpWidget(
        Builder(
          builder: (BuildContext context) {
            return ConditionBuilder(
              condition: (_) => true,
              trueBuilder: (_) => trueWidget,
              fallbackBuilder: (_) => fallbackWidget,
            );
          },
        ),
      );

      expect(find.byWidget(trueWidget), findsOneWidget);
      expect(find.byWidget(fallbackWidget), findsNothing);
    },
  );

  testWidgets(
    'ConditionBuilder should call fallbackBuilder if condition == false',
    (WidgetTester tester) async {
      final Widget trueWidget = Container();
      final Widget fallbackWidget = Container();
      await tester.pumpWidget(
        Builder(
          builder: (BuildContext context) {
            return ConditionBuilder(
              condition: (_) => false,
              trueBuilder: (_) => trueWidget,
              fallbackBuilder: (_) => fallbackWidget,
            );
          },
        ),
      );

      expect(find.byWidget(fallbackWidget), findsOneWidget);
      expect(find.byWidget(trueWidget), findsNothing);
    },
  );

  testWidgets(
    'ConditionWidget should use widget if condition == true',
    (WidgetTester tester) async {
      final Widget trueWidget = Container();
      final Widget fallbackWidget = Container();
      await tester.pumpWidget(
        Builder(
          builder: (BuildContext context) {
            return ConditionWidget(
              condition: true,
              widget: trueWidget,
              fallback: fallbackWidget,
            );
          },
        ),
      );

      expect(find.byWidget(trueWidget), findsOneWidget);
      expect(find.byWidget(fallbackWidget), findsNothing);
    },
  );

  testWidgets(
    'ConditionWidget should use fallback if condition == false',
    (WidgetTester tester) async {
      final Widget trueWidget = Container();
      final Widget fallbackWidget = Container();
      await tester.pumpWidget(
        Builder(
          builder: (BuildContext context) {
            return ConditionWidget(
              condition: false,
              widget: trueWidget,
              fallback: fallbackWidget,
            );
          },
        ),
      );

      expect(find.byWidget(trueWidget), findsNothing);
      expect(find.byWidget(fallbackWidget), findsOneWidget);
    },
  );
}
