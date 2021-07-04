# proviso
 ![stability-stable](https://img.shields.io/badge/stability-stable-green.svg)
 [![License](https://img.shields.io/badge/License-BSD%203--Clause-blue.svg)](https://opensource.org/licenses/BSD-3-Clause)

A complete set of tools for conditional rendering (`if`-`else` and `switch` conditions), 
subtree wrapping with a parent widget, 
and some handy shortcuts (like DebugWidget, WebOnlyWidget, SafeBuilder, and many more). :+1:

### Install

In flutter project add the dependency:

```yml
dependencies:
  ...
  proviso: ^1.0.0
```

## Why
To make a more readable and simpler conditional statement code.

### All variants of conditional rendering you will ever need in a single package
in the form of widgets:
```dart
Row(
  children: [
    ConditionWidget(
      condition: starred,
      widget: Icon(
        Icons.favorite
      )
    ),
    ConditionWidget(
      condition: archived,
      widget: Icon(
        Icons.archive
      )
    )  
  ]
)
```
```dart
ConditionBuilder(
  condition: (_) => someCondition,
  trueBuilder: (_) => trueWidget,
  fallbackBuilder: (_) => fallbackWidget
);
```
builders:
```dart
ConditionalBuilder.widget(
  context: context,
  condition: (_) => _evaluateSomething(),
  trueBuilder: (_) => trueWidget,
  fallbackBuilder: (_) => fallbackWidget,
);
```
switch case widgets and builders:
```dart
final Widget targetConditionWidget = Container();
final Widget fallbackWidget = Container();

SwitchCaseBuilder.widget<String>(
  context: context,
  condition: (_) => '1',
  caseBuilders: {'1': (_) => targetConditionWidget, '2': (_) => Container()},
  fallbackBuilder: (_) => fallbackWidget,
);  
```
### conditional parent widget
```dart
ConditionalWrap(
  shouldWrap: shouldWrapChildInParent,
  child: Container(),
  parentBuilder: (child) => Container(
    child: child,
  ),
)
```
### try/catch builders
```dart
SafeBuilder(
  widgetBuilder: (_) => validWidget,
  fallbackBuilder: (e, _) => fallbackWidget, // called if widgetBuilder fails with error
)
```
#### and some more like:
```dart
DebugOnlyWidget, MobileOnlyWidget, WebOnlyWidget etc
```
#### Can conditionally render a single widget or a list of widgets
```dart
ConditionalBuilder.widgets(
  context: context,
  condition: (_) => true,
  trueBuilder: (_) => [Container(), Container()],
  fallbackBuilder: (_) => [],
)
```
## Contributions

Feel free to [report bugs, request new features](https://github.com/AlexeyPerov/proviso/issues) 
or to [contribute](https://github.com/AlexeyPerov/proviso/pulls) to this project! 
