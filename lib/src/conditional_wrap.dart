import 'package:flutter/material.dart';

/// Wraps [child] in [parentBuilder] in case of [shouldWrap] == true.
/// Otherwise just returns [child]
///
/// ConditionalWrap(
///   shouldWrap: condition,
///   child: Widget(),
///   parentBuilder: (Widget child) => ParentWidget(child: child),
///);
class ConditionalWrap extends StatelessWidget {
  const ConditionalWrap({
    Key? key,
    required this.shouldWrap,
    required this.child,
    required this.parentBuilder,
  }) : super(key: key);

  final Widget child;
  final bool shouldWrap;

  final Widget Function(Widget child) parentBuilder;

  @override
  Widget build(BuildContext context) {
    return shouldWrap ? this.parentBuilder(this.child) : this.child;
  }
}