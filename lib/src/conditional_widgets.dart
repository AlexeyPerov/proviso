import 'package:flutter/material.dart';

class Conditional {
  Conditional._();

  /// Returns single [widget] in case [condition] == true,
  /// otherwise returns [fallback] which defaults to Container().
  static Widget widget({
    required BuildContext context,
    required bool condition,
    required Widget widget,
    Widget? fallback,
  }) {
    if (condition) {
      return widget;
    } else {
      return fallback != null ? fallback : Container();
    }
  }

  /// Returns list of [widgets] in case [condition] == true,
  /// otherwise returns [fallback] which defaults to Container().
  static List<Widget> widgets({
    required BuildContext context,
    required bool condition,
    required List<Widget> widgets,
    List<Widget>? fallback,
  }) {
    if (condition) {
      return widgets;
    } else {
      return fallback != null ? fallback : List<Widget>.empty();
    }
  }
}

class ConditionalBuilder {
  ConditionalBuilder._();

  /// Builds single Widget via [trueBuilder] in case [condition] == true,
  /// else calls [fallbackBuilder] which defaults to Container().
  static Widget widget({
    required BuildContext context,
    required bool Function(BuildContext context) condition,
    required Widget Function(BuildContext context) trueBuilder,
    Widget Function(BuildContext context)? fallbackBuilder,
  }) {
    if (condition(context)) {
      return trueBuilder(context);
    } else {
      return fallbackBuilder != null ? fallbackBuilder(context) : Container();
    }
  }

  /// Builds list of Widget via [trueBuilder] in case [condition] == true,
  /// otherwise calls [fallbackBuilder] which defaults to List.empty().
  static List<Widget> widgets({
    required BuildContext context,
    required bool Function(BuildContext context) condition,
    required List<Widget> Function(BuildContext context) trueBuilder,
    List<Widget> Function(BuildContext context)? fallbackBuilder,
  }) {
    if (condition(context)) {
      return trueBuilder(context);
    } else {
      return fallbackBuilder != null
          ? fallbackBuilder(context)
          : List<Widget>.empty();
    }
  }

  /// Calls [trueBuilder] in case [condition] == true,
  /// else calls [fallbackBuilder] which defaults to Container().
  static T generic<T>({
    required BuildContext context,
    required bool Function(BuildContext context) condition,
    required T Function(BuildContext context) trueBuilder,
    required T Function(BuildContext context) fallbackBuilder,
  }) {
    if (condition(context)) {
      return trueBuilder(context);
    } else {
      return fallbackBuilder(context);
    }
  }
}
