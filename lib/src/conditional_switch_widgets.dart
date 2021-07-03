import 'package:flutter/material.dart';

class SwitchCase {
  SwitchCase._();

  /// Returns [caseWidgets] value where key == [condition].
  /// If nothing found returns [fallback] which defaults to Container().
  static Widget widget<T>({
    required BuildContext context,
    required T condition,
    required Map<T, Widget> caseWidgets,
    Widget? fallback,
  }) {
    final T value = condition;
    if (caseWidgets[value] != null) {
      return caseWidgets[value]!;
    } else {
      return fallback != null ? fallback : Container();
    }
  }

  /// Returns [caseWidgets] value where key == [condition].
  /// If nothing found calls [fallback] which defaults to List.empty().
  static List<Widget> widgets<T>({
    required BuildContext context,
    required T Function(BuildContext context) condition,
    required Map<T, List<Widget>> caseWidgets,
    List<Widget>? fallback,
  }) {
    final T value = condition(context);
    if (caseWidgets[value] != null) {
      return caseWidgets[value]!;
    } else {
      return fallback != null ? fallback : List.empty();
    }
  }
}

class SwitchCaseBuilder {
  SwitchCaseBuilder._();

  /// Calls [caseBuilders] value where key == [condition].
  /// If nothing found calls [fallbackBuilder] which defaults to Container().
  static Widget widget<T>({
    required BuildContext context,
    required T Function(BuildContext context) condition,
    required Map<T, Widget Function(BuildContext context)> caseBuilders,
    Widget Function(BuildContext context)? fallbackBuilder,
  }) {
    final T value = condition(context);
    if (caseBuilders[value] != null) {
      return caseBuilders[value]!(context);
    } else {
      return fallbackBuilder != null ? fallbackBuilder(context) : Container();
    }
  }

  /// Calls [caseBuilders] value where key == [condition].
  /// If nothing found calls [fallbackBuilder] which defaults to List.empty().
  static List<Widget> widgets<T>({
    required BuildContext context,
    required T Function(BuildContext context) condition,
    required Map<T, List<Widget> Function(BuildContext context)> caseBuilders,
    List<Widget> Function(BuildContext context)? fallbackBuilder,
  }) {
    final T value = condition(context);
    if (caseBuilders[value] != null) {
      return caseBuilders[value]!(context);
    } else {
      return fallbackBuilder != null ? fallbackBuilder(context) : List.empty();
    }
  }
}