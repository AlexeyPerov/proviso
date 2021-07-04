import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:io';

/// Returns [widget] in case [condition] == true
/// otherwise returns [fallback] which defaults to Container()
class ConditionWidget extends StatelessWidget {
  final bool condition;
  final Widget widget;
  final Widget? fallback;

  const ConditionWidget(
      {Key? key, required this.condition, required this.widget, this.fallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return condition
        ? widget
        : fallback != null
            ? fallback!
            : Container();
  }
}

/// Calls [trueBuilder] in case [condition] == true
/// otherwise calls [fallbackBuilder] which defaults Container()
class ConditionBuilder extends StatelessWidget {
  final bool Function(BuildContext context) condition;
  final Widget Function(BuildContext context) trueBuilder;
  final Widget Function(BuildContext context)? fallbackBuilder;

  const ConditionBuilder(
      {Key? key,
      required this.condition,
      required this.trueBuilder,
      this.fallbackBuilder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (condition(context)) {
      return trueBuilder(context);
    } else {
      return fallbackBuilder != null ? fallbackBuilder!(context) : Container();
    }
  }
}

/// Shortcuts for special cases

class DebugModeWidget extends ConditionWidget {
  const DebugModeWidget({Key? key, required Widget widget, Widget? fallback})
      : super(
            key: key,
            widget: widget,
            condition: !kReleaseMode,
            fallback: fallback);
}

class ReleaseModeWidget extends ConditionWidget {
  const ReleaseModeWidget({Key? key, required Widget widget, Widget? fallback})
      : super(
            key: key,
            widget: widget,
            condition: kReleaseMode,
            fallback: fallback);
}

class ProfileModeWidget extends ConditionWidget {
  const ProfileModeWidget({Key? key, required Widget widget, Widget? fallback})
      : super(
            key: key,
            widget: widget,
            condition: kProfileMode,
            fallback: fallback);
}

class WebOnlyWidget extends ConditionWidget {
  const WebOnlyWidget({Key? key, required Widget widget, Widget? fallback})
      : super(key: key, widget: widget, condition: kIsWeb, fallback: fallback);
}

class MobileOnlyWidget extends ConditionWidget {
  MobileOnlyWidget({Key? key, required Widget widget, Widget? fallback})
      : super(
            key: key,
            widget: widget,
            condition:
                Platform.isAndroid || Platform.isIOS || Platform.isFuchsia,
            fallback: fallback);
}

class DesktopOnlyWidget extends ConditionWidget {
  DesktopOnlyWidget({Key? key, required Widget widget, Widget? fallback})
      : super(
            key: key,
            widget: widget,
            condition:
                Platform.isWindows || Platform.isMacOS || Platform.isLinux,
            fallback: fallback);
}
