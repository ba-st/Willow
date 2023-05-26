# Migration Guide

## Version 13 to 14

`evaluate:` and `determineBehaviorByEvaluating:` have been merged into
`serverDo:`. The block passed as collaborator can optionally contain an argument
which represents the `:request`. In the previous version this argument was
mandatory for `determineBehaviorByEvaluating:` and named `:response`.

`evaluate:with:` and `determineBehaviorByEvaluating:with:` have been merged into
`with:serverDo:`. The block passed as collaborator can optionally contain an
argument which represents the `:request`. In the previous version this argument
was mandatory for `determineBehaviorByEvaluating:with:` and named `:response`.
The value of the parameter can be obtained by sending `request parameter`. In
the previous version this was the single argument for the block in `evaluate:with:`
and the second argument in `determineBehaviorByEvaluating:with:`.

`onlyWhen:determineBehaviorByEvaluating:with:` has been renamed to `with:onlyWhen:serverDo:`.
The block passed as collaborator can optionally contain an argument which represents
the `:request`. In the previous version this argument was mandatory and named `:response`.
The value of the parameter can be obtained by sending `request parameter`. In
the previous version this was the second argument of the block, now removed. In
the previous version the condition was a string that had to contain a macro to
expand with the argument, this has been changed to a block that optionally
receives the parameter as a JavaScript object and must return a JavaScript
boolean condition.

`onReturn` has been renamed to `onRespond`

`executeOnClient:` has been renamed to `userAgentDo:`

`addCssClass:`, `addCssClass:toComponentsMatching:`,
`changeCssClass: anExistingStyle to:`, `removeCssClass:fromComponentsMatching:`,
`removeCssClass:fromComponentsWithClass:`, `toggleCssClass:`, `toggleCssClass:on:`,
`toggleCssClass:onComponentsMatching:` have been replaced with the simplified
methods `updateCssClasses:` and `updateCssClasses:onElementsMatching:`, where
the first one is a shortcut to affecting only the component being triggered. To
achieve the same effect, the new method receives a block which can build
transformations. For example to add a CSS class on all elements already
presenting another class

```smalltalk
component
  updateCssClasses: [ :classes | classes addClass: aNewCSSClass ]
  onElementsMatching: [ :canvas | canvas jQuery class: anExistingCSSClass ];
```

`onTrigger` has changed so that specific events can be referenced. To get the
previous behavior all senders of `onTrigger` should instead send `on trigger`.
To access other events check the protocol offered by `EventInterpreterDispatcher`.
For example to configure the behavior on mouse over, send `on mouseOver` then
configure as usual.

For custom events, use `on eventNamed:` followed by a symbol with the JavaScript
method to call. This custom interaction assumes by default that no serialization
is required on the triggering component. To override this behavior, simply add
the corresponding serialization command, for example:

```smalltalk
  ( selectionList on eventNamed: #blur )
    serializeThis;
    serverDo: [ ... ]
```

Uses of `CombinedWebInteractionInterpreter combiningInterpretersOf:` should be
changed to `CombinedEventInterpreterDispatcher combiningInterpretersOfAll:`.

In the rare case of external use of interpreters, some deprecations have been
prepared.
`WebInteractionInterpreter forClickOnComponent` transform to
`EventInterpreterDispatcher defaultingToClick`
`WebInteractionInterpreter forChangeInComponentValue` transforms to
`EventInterpreterDispatcher defaultingToChange`
`WebInteractionInterpreter forClickOnHiddenInputDependentComponent` transforms to
`EventInterpreterDispatcher defaultingToClickHidden`
`WebInteractionInterpreter forChangeInHiddenInputDependentComponentValue`
transforms to `EventInterpreterDispatcher defaultingToChangeHidden`
`WebInteractionInterpreter forReleaseOfKeyInComponent` transforms to
`EventInterpreterDispatcher defaultingToKeyUp`

Instance creation protocol for `TextFieldWebView` has been changed so that the
default is always on change, since the key up behavior can now be achieved by
sending `on keyUp` to any instance.
To reflect this,
`multiLineTriggeringOnChangeApplying:` has been renamed to `multiLineApplying:`
`singleLineTriggeringOnChangeApplying:` has been renamed to `singleLineApplying:`

`PhrasingContainerWebView`, `GenericContainerWebView` and `IdentifiedWebView`
have all been replaced by `ContainerWebView`. The deprecated classes are now
located in the migration package `Willow-Core-MigrationTo14` and all their
instance creation method now include a transformation rule. If the senders have
access to a component supplier, "divs" can be created by sending
`divisionContainerWrapping:applying:` and "spans" by sending
`inlineContainerWrapping:applying:`. For all other scenarios, a `ContainerWebView`
can specify the code to create the container element in the second argument of
`wrapping:intoElementBuiltUsing:applying:`. The old requirement of using an
`IdentifiedWebView` to allow re-rendering applies now to `ContainerWebView`,
except this new class will only specify an id when its interaction is configured
before it is rendered for the first time. Checks have been implemented to detect
cases where the developer might need to send `beIdentifiable`in order to ensure
an id is created for the container element.

`DropDownListWebView` and `SingleSelectionListBoxWebView` have been replaced by
`SingleSelectionWebView`. The deprecated classes are now located in the migration
package `Willow-Core-MigrationTo14` and all their instance creation method now
include a transformation rule. If the senders have access to a component supplier,
drop-downs can be created by sending `dropdownListApplying:` and list boxes by
sending `listBoxDisplayingAtOnce:applying:`. Otherwise, they can be created by
sending the corresponding instance creation method in `SingleSelectionWebView`.

## Version 10 to 11

`executeOnClient:` no longer receives the script and now the block result it's
automatically attached to it. So you have to:

- Replace the senders of
  `executeOnClient: [:script :canvas |  statements . script << expression ]`
  with: `executeOnClient: [:canvas |  statements. expression ]`
- If you have several statements of the form
  `script << expression. script << anotherExpression.` you have two options:
  - Change it to send several times `executeOnClient:`
  - Use the `,` to concatenate the expressions.

## Version 9 to 10

- If you were directly referencing `WillowCssStyles` or `WillowConstants` now
  you need to include the `Willow` shared pool and use `Classification` and
  `Constants`, and change the message sending so, for example:
`WillowCssStyles willow` turns into `Classification >> #willow`.
- Change senders of constants in commands, so for example:
  `[:div :constants | constants willow dialogSectionName ... ]` turns into:
  `[:div :constants | constants >> #willow >> #dialogSectionName ... ]`
- Senders of `cssFonts` must use `constants >> #css`

## Version 8 to 9

The following methods have been deprecated and can be automatically converted
using the proposed rewrite expressions:

- `TableWebViewBuilder >> addColumnTitled: aTitle rendering: aRenderingCommand`

  ```smalltalk
    `@receiver addColumnTitled: `@aTitle rendering: `@aRenderingCommand
  ```

  →

  ```smalltalk
  `@receiver addColumn: [ :column | column titled: `@aTitle;
    rendering: ̀`@aRenderingCommand ]
  ```  

- `TableWebViewBuilder >> addColumnTitled: aTitle rendering: aRenderingCommand
   applyingToCells: aCellCommand applyingToHeading: aHeadingCommand`

  ```smalltalk
  `@receiver
    addColumnTitled: `@aTitle rendering:`@aRenderingCommand
    applyingToCells: `@aCellCommand applyingToHeading:`@aHeadingCommand
  ```

  →

  ```smalltalk
  `@receiver addColumn: [ :column |
    column
      titled: ̀`@aTitle applying: `@aHeadingCommand;
      rendering: `@aRenderingCommand;
      applyingToEachCell: `@aCellCommand ]
  ```

- `TableWebViewBuilder >> addColumnTitled: aTitle rendering: aRenderingCommand
  applyingToCells: aCellCommand applyingToHeading: aHeadingCommand summarizedWith:
  aFooterRenderingCommand applyingToFooter: aFooterCommand`

  ```smalltalk
  `@receiver
    addColumnTitled: `@aTitle rendering: `@aRenderingCommand
    applyingToCells: `@aCellCommand applyingToHeading: `@aHeadingCommand
    summarizedWith: `@aFooterRenderingCommand applyingToFooter: `@aFooterCommand
  ```

  →

  ```smalltalk
  `@receiver addColumn: [ :column |
    column
      titled: `@aTitle applying: `@aHeadingCommand;
      rendering: `@aRenderingCommand;
      applyingToEachCell: `@aCellCommand;
      summarizedWith: `@aFooterRenderingCommand applying: `@aFooterCommand ]
  ```

- `TableWebViewBuilder >> addUntitledColumnRendering: aRenderingCommand`

  ```smalltalk
  `@receiver addUntitledColumnRendering: `@aRenderingCommand'
  ```

  →

  ```smalltalk
  `@receiver addColumn: [ :column | column rendering: `@aRenderingCommand ]
  ```

The following method has been deprecated, and the action is just to remove the
senders, because now tables built using the builder will automatically detect if
a header is needed or not.

- `TableWebViewBuilder >> beHeadless`

The following methods have been deprecated, and the senders must be adapted to use
the `TableWebViewBuilder` API:

- `TableWebView class >> definedBy: aColumnRendererCollection applying:
  aTableCommand headerRenderedBy: aHeader applyingToEachRow: aRowCommand`
- `TableWebView class >> headedDefinedBy: aColumnRendererCollection applying: aTableCommand`
- `TableWebView class >> headlessDefinedBy: aColumnRendererCollection applying: aTableCommand`
- `WebTableColumnRenderer class >> titled: aName applyingToEachCell: aCommandToCell
  renderingWith: aRenderingCommand applyingToHeading: aCommandToHeading`
- `WebTableColumnRenderer class >> titled: aName renderingItemWith: aRenderingCommand`
- `WebTableColumnRenderer class >> titled: aTitle renderingItemWith: aRenderingCommand
  summarizedWith: aFooterRenderingCommand`
- `WebTableColumnRenderer class >> untitledRenderingItemWith: aRenderingCommand`
- `WebTableColumnRenderer class >> untitledRenderingItemWith: aRenderingCommand
  summarizedWith: aFooterRenderingCommand`

The following classes and methods has been removed (in the future they will be
superseded by new functionality)

- `WebTableMultiColumnRenderer`
- `TableWebViewBuilder >> #addColumnTitled:renderingAll:`
- `TableWebViewBuilder >> #addColumnTitled:renderingAll:applyingToCells:applyingToHeading:`
