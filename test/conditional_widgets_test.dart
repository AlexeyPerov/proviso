import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:proviso/proviso.dart';

void main() {
  testWidgets(
    'ConditionalBuilder.widget should call trueBuilder if condition == true',
    (WidgetTester tester) async {
      final Widget trueWidget = Container();
      final Widget fallbackWidget = Container();
      await tester.pumpWidget(
        Builder(
          builder: (BuildContext context) {
            return ConditionalBuilder.widget(
              context: context,
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
    'ConditionalBuilder.widget should call fallbackBuilder '
    'if condition == false',
    (WidgetTester tester) async {
      final Widget trueWidget = Container();
      final Widget fallbackWidget = Container();
      await tester.pumpWidget(
        Builder(
          builder: (BuildContext context) {
            return ConditionalBuilder.widget(
              context: context,
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
    'ConditionalBuilder.widgets should call trueBuilder if condition == true',
    (WidgetTester tester) async {
      final List<Widget> trueWidgetList = [Container()];
      final List<Widget> fallbackWidgetList = [Container()];
      await tester.pumpWidget(
        Builder(
          builder: (BuildContext context) {
            return Column(
                children: ConditionalBuilder.widgets(
              context: context,
              condition: (_) => true,
              trueBuilder: (_) => trueWidgetList,
              fallbackBuilder: (_) => fallbackWidgetList,
            ));
          },
        ),
      );

      for (Widget widget in trueWidgetList) {
        expect(find.byWidget(widget), findsOneWidget);
      }

      for (Widget widget in fallbackWidgetList) {
        expect(find.byWidget(widget), findsNothing);
      }
    },
  );

  testWidgets(
    'ConditionalBuilder.widgets should call fallbackBuilder'
    ' if condition == false',
    (WidgetTester tester) async {
      final List<Widget> trueWidgetList = [Container()];
      final List<Widget> fallbackWidgetList = [Container()];
      await tester.pumpWidget(
        Builder(
          builder: (BuildContext context) {
            return Column(
                children: ConditionalBuilder.widgets(
              context: context,
              condition: (_) => false,
              trueBuilder: (_) => trueWidgetList,
              fallbackBuilder: (_) => fallbackWidgetList,
            ));
          },
        ),
      );

      for (Widget widget in trueWidgetList) {
        expect(find.byWidget(widget), findsNothing);
      }

      for (Widget widget in fallbackWidgetList) {
        expect(find.byWidget(widget), findsOneWidget);
      }
    },
  );

  testWidgets(
    'Conditional.widget should use widget if condition == true',
    (WidgetTester tester) async {
      final Widget trueWidget = Container();
      final Widget fallbackWidget = Container();
      await tester.pumpWidget(
        Builder(
          builder: (BuildContext context) {
            return Conditional.widget(
              context: context,
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
    'Conditional.widget should use fallback if condition == false',
    (WidgetTester tester) async {
      final Widget trueWidget = Container();
      final Widget fallbackWidget = Container();
      await tester.pumpWidget(
        Builder(
          builder: (BuildContext context) {
            return Conditional.widget(
              context: context,
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

  testWidgets(
    'Conditional.widgets should use widgets if condition == true',
    (WidgetTester tester) async {
      final List<Widget> trueWidgetList = [Container()];
      final List<Widget> fallbackWidgetList = [Container()];
      await tester.pumpWidget(
        Builder(
          builder: (BuildContext context) {
            return Column(
              children: Conditional.widgets(
                context: context,
                condition: true,
                widgets: trueWidgetList,
                fallback: fallbackWidgetList,
              ),
            );
          },
        ),
      );

      for (Widget widget in trueWidgetList) {
        expect(find.byWidget(widget), findsOneWidget);
      }

      for (Widget widget in fallbackWidgetList) {
        expect(find.byWidget(widget), findsNothing);
      }
    },
  );

  testWidgets(
    'Conditional.widgets should use fallback if condition == false',
    (WidgetTester tester) async {
      final List<Widget> trueWidgetList = [Container()];
      final List<Widget> fallbackWidgetList = [Container()];
      await tester.pumpWidget(
        Builder(
          builder: (BuildContext context) {
            return Column(
              children: Conditional.widgets(
                context: context,
                condition: false,
                widgets: trueWidgetList,
                fallback: fallbackWidgetList,
              ),
            );
          },
        ),
      );

      for (Widget widget in fallbackWidgetList) {
        expect(find.byWidget(widget), findsOneWidget);
      }

      for (Widget widget in trueWidgetList) {
        expect(find.byWidget(widget), findsNothing);
      }
    },
  );
}
