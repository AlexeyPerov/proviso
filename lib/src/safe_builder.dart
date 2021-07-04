import 'package:flutter/material.dart';

/// Calls [widgetBuilder] in case [condition] == true
/// otherwise calls [fallbackBuilder] which defaults to Container().
class SafeBuilder extends StatelessWidget {
  final Widget Function(BuildContext context) widgetBuilder;
  final Widget Function(Object error, BuildContext context)? fallbackBuilder;

  const SafeBuilder(
      {Key? key, required this.widgetBuilder, this.fallbackBuilder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    try {
      return widgetBuilder(context);
    } catch (error) {
      return fallbackBuilder != null
          ? fallbackBuilder!(error, context)
          : Container();
    }
  }
}
