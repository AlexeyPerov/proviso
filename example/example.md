#### The simplest usage (ConditionWidget and ConditionBuilder)
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
#### ConditionalBuilder for single widget
```dart
ConditionalBuilder.widget(
  context: context,
  condition: (_) => _evaluateSomething(),
  trueBuilder: (_) => trueWidget,
  fallbackBuilder: (_) => fallbackWidget,
);
```
#### ConditionalBuilder for widget list
```dart
ConditionalBuilder.widgets(
  context: context,
  condition: (_) => true,
  trueBuilder: (_) => trueWidgetList,
  fallbackBuilder: (_) => fallbackWidgetList,
)
```
#### SwitchCaseBuilder for single widget
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
#### SwitchCaseBuilder for widget list
```dart
final List<Widget> targetConditionWidgetList = [Container()];
final List<Widget> fallbackWidgetList = [Container()];

SwitchCaseBuilder.widgets<String>(
context: context,
condition: (_) => '1',
caseBuilders: {'1': (_) => targetConditionWidgetList},
fallbackBuilder: (_) => fallbackWidgetList,
)  
```
#### Conditional parent widget
```dart
ConditionalWrap(
  shouldWrap: shouldWrapChildInParent,
  child: Container(),
  parentBuilder: (child) => Container(
    child: child,
  ),
)
```
#### try/catch builders
```dart
SafeBuilder(
  widgetBuilder: (_) => validWidget,
  fallbackBuilder: (e, _) => fallbackWidget, // called if widgetBuilder fails with error
)
```