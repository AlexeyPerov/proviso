import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:proviso/proviso.dart';

void main() {
  testWidgets(
    'SwitchCaseBuilder.widget should use caseBuilder by case "1" '
        'if condition == "1"',
    (WidgetTester tester) async {
      final Widget targetConditionWidget = Container();
      final Widget fallbackWidget = Container();
      await tester.pumpWidget(
        Builder(
          builder: (BuildContext context) {
            return SwitchCaseBuilder.widget<String>(
              context: context,
              condition: (_) => '1',
              caseBuilders: {'1': (_) => targetConditionWidget},
              fallbackBuilder: (_) => fallbackWidget,
            );
          },
        ),
      );

      expect(find.byWidget(targetConditionWidget), findsOneWidget);
      expect(find.byWidget(fallbackWidget), findsNothing);
    },
  );

  testWidgets(
    'SwitchCaseBuilder.widget should use fallbackBuilder '
        'if condition is not suitable by any case',
    (WidgetTester tester) async {
      final Widget targetConditionWidget = Container();
      final Widget fallbackWidget = Container();
      await tester.pumpWidget(
        Builder(
          builder: (BuildContext context) {
            return SwitchCaseBuilder.widget<dynamic>(
              context: context,
              condition: (_) => '0',
              caseBuilders: {'1': (_) => targetConditionWidget},
              fallbackBuilder: (_) => fallbackWidget,
            );
          },
        ),
      );

      expect(find.byWidget(fallbackWidget), findsOneWidget);
      expect(find.byWidget(targetConditionWidget), findsNothing);
    },
  );

  testWidgets(
    'SwitchCaseBuilder.widgets should use widgets list by case "1" '
        'if condition == "1"',
    (WidgetTester tester) async {
      final List<Widget> targetConditionWidgetList = [Container()];
      final List<Widget> fallbackWidgetList = [Container()];
      await tester.pumpWidget(
        Builder(
          builder: (BuildContext context) {
            return Column(
              children: SwitchCaseBuilder.widgets<String>(
                context: context,
                condition: (_) => '1',
                caseBuilders: {'1': (_) => targetConditionWidgetList},
                fallbackBuilder: (_) => fallbackWidgetList,
              ),
            );
          },
        ),
      );

      for (Widget widget in targetConditionWidgetList) {
        expect(find.byWidget(widget), findsOneWidget);
      }

      for (Widget widget in fallbackWidgetList) {
        expect(find.byWidget(widget), findsNothing);
      }
    },
  );

  testWidgets(
    'SwitchCaseBuilder.widgets should use fallback widgets list '
        'if condition is not suitable by any case',
    (WidgetTester tester) async {
      final List<Widget> targetConditionWidgetList = [Container()];
      final List<Widget> fallbackWidgetList = [Container()];
      await tester.pumpWidget(
        Builder(
          builder: (BuildContext context) {
            return Column(
              children: SwitchCaseBuilder.widgets<String>(
                context: context,
                condition: (_) => '0',
                caseBuilders: {'1': (_) => targetConditionWidgetList},
                fallbackBuilder: (_) => fallbackWidgetList,
              ),
            );
          },
        ),
      );

      for (Widget widget in targetConditionWidgetList) {
        expect(find.byWidget(widget), findsNothing);
      }

      for (Widget widget in fallbackWidgetList) {
        expect(find.byWidget(widget), findsOneWidget);
      }
    },
  );

  testWidgets(
    'SwitchCase.widget should use caseBuilder by case "1" '
        'if condition == "1"',
        (WidgetTester tester) async {
      final Widget targetConditionWidget = Container();
      final Widget fallbackWidget = Container();
      await tester.pumpWidget(
        Builder(
          builder: (BuildContext context) {
            return SwitchCase.widget<String>(
              context: context,
              condition: '1',
              caseWidgets: {'1': targetConditionWidget},
              fallback: fallbackWidget,
            );
          },
        ),
      );

      expect(find.byWidget(targetConditionWidget), findsOneWidget);
      expect(find.byWidget(fallbackWidget), findsNothing);
    },
  );

  testWidgets(
    'SwitchCase.widget should use fallback widget '
        'if condition is not suitable by any case',
        (WidgetTester tester) async {
      final Widget targetConditionWidget = Container();
      final Widget fallbackWidget = Container();
      await tester.pumpWidget(
        Builder(
          builder: (BuildContext context) {
            return SwitchCase.widget<String>(
              context: context,
              condition: '0',
              caseWidgets: {'1': targetConditionWidget},
              fallback: fallbackWidget,
            );
          },
        ),
      );

      expect(find.byWidget(targetConditionWidget), findsNothing);
      expect(find.byWidget(fallbackWidget), findsOneWidget);
    },
  );

  testWidgets(
    'SwitchCase.widgets should use widgets list by case "1" '
        'if condition == "1"',
    (WidgetTester tester) async {
      final List<Widget> targetConditionWidgetList = [Container()];
      final List<Widget> fallbackWidgetList = [Container()];
      await tester.pumpWidget(
        Builder(
          builder: (BuildContext context) {
            return Column(
              children: SwitchCase.widgets<String>(
                context: context,
                condition: (_) => '1',
                caseWidgets: {'1': targetConditionWidgetList},
                fallback: fallbackWidgetList,
              ),
            );
          },
        ),
      );

      for (Widget widget in targetConditionWidgetList) {
        expect(find.byWidget(widget), findsOneWidget);
      }

      for (Widget widget in fallbackWidgetList) {
        expect(find.byWidget(widget), findsNothing);
      }
    },
  );

  testWidgets(
    'SwitchCase.widgets should use fallback widgets list '
        'if condition is not suitable by any case',
    (WidgetTester tester) async {
      final List<Widget> targetConditionWidgetList = [Container()];
      final List<Widget> fallbackWidgetList = [Container()];
      await tester.pumpWidget(
        Builder(
          builder: (BuildContext context) {
            return Column(
              children: SwitchCase.widgets<dynamic>(
                context: context,
                condition: (_) => 0,
                caseWidgets: {'1': targetConditionWidgetList},
                fallback: fallbackWidgetList,
              ),
            );
          },
        ),
      );

      for (Widget widget in fallbackWidgetList) {
        expect(find.byWidget(widget), findsOneWidget);
      }

      for (Widget widget in targetConditionWidgetList) {
        expect(find.byWidget(widget), findsNothing);
      }
    },
  );
}
