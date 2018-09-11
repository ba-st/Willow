# Migration Guide

## Version 10 to 11

`executeOnClient:` no longer receives the script and now the block result it's automatically attached to it. So you have to:

- Replace the senders of `executeOnClient: [:script :canvas |  statements . script << expression ]` with: `executeOnClient: [:canvas |  statements. expression ] `
- If you have several statements of the form `script << expression. script << anotherExpression.` you have two options:
  - Change it to send several times `executeOnClient:`
  - Use the `, ` to concatenate the expressions.


## Version 9 to 10

- If you we're directly referencing `WillowCssStyles` or `WillowConstants` now you need to include the `Willow` shared pool and use `Classification` and `Constants`, and change the message sending so, for example:
`WillowCssStyles willow` turns into `Classification >> #willow`.
- Change senders of constants in commands, so for example: `[:div :constants | constants willow dialogSectionName ... ]` turns into: `[:div :constants | constants >> #willow >> #dialogSectionName ... ]`
- Senders of `cssFonts` must use `constants >> #css`

## Version 8 to 9

The following methods has been deprecated and can be automatically converted using the proposed rewrite expressions:
- `TableWebViewBuilder >> addColumnTitled: aTitle rendering: aRenderingCommand`
```smalltalk
  `@receiver addColumnTitled: `@aTitle rendering: `@aRenderingCommand
```
->
```smalltalk
`@receiver addColumn: [ :column | column titled: `@aTitle; rendering: ̀`@aRenderingCommand ]
```  
- `TableWebViewBuilder >> addColumnTitled: aTitle rendering: aRenderingCommand applyingToCells: aCellCommand applyingToHeading: aHeadingCommand`
```smalltalk
`@receiver addColumnTitled: ̀`@aTitle rendering: ̀`@aRenderingCommand applyingToCells: `@aCellCommand applyingToHeading: ̀`@aHeadingCommand
```
->
```smalltalk
`@receiver addColumn: [ :column | column titled: ̀`@aTitle applying: `@aHeadingCommand; rendering: `@aRenderingCommand; applyingToEachCell: `@aCellCommand ]'
```
- `TableWebViewBuilder >> addColumnTitled: aTitle rendering: aRenderingCommand applyingToCells: aCellCommand applyingToHeading: aHeadingCommand summarizedWith: aFooterRenderingCommand applyingToFooter: aFooterCommand`
```smalltalk
`@receiver addColumnTitled: ̀`@aTitle rendering: `@aRenderingCommand applyingToCells: `@aCellCommand applyingToHeading: `@aHeadingCommand summarizedWith: `@aFooterRenderingCommand applyingToFooter: `@aFooterCommand
```
->
```smalltalk
`@receiver addColumn: [ :column | column titled: `@aTitle applying: `@aHeadingCommand; rendering: `@aRenderingCommand; applyingToEachCell: `@aCellCommand; summarizedWith: `@aFooterRenderingCommand applying: `@aFooterCommand ]
```
- `TableWebViewBuilder >> addUntitledColumnRendering: aRenderingCommand`
```smalltalk
`@receiver addUntitledColumnRendering: `@aRenderingCommand'
```
->
```smalltalk
`@receiver addColumn: [ :column | column rendering: `@aRenderingCommand ]
```

The following method has been deprecated and the action is just remove the senders, because now tables built using the builder will automatically detect if a header is needed or not.

- `TableWebViewBuilder >> beHeadless`

The following methods has been deprecated and the senders must be adapted to use the TableWebViewBuilder API:
- `TableWebView class >> definedBy: aColumnRendererCollection applying: aTableCommand headerRenderedBy: aHeader applyingToEachRow: aRowCommand`
- `TableWebView class >> headedDefinedBy: aColumnRendererCollection applying: aTableCommand`
- `TableWebView class >> headlessDefinedBy: aColumnRendererCollection applying: aTableCommand`
- `WebTableColumnRenderer class >> titled: aName applyingToEachCell: aCommandToCell renderingWith: aRenderingCommand applyingToHeading: aCommandToHeading`
- `WebTableColumnRenderer class >> titled: aName renderingItemWith: aRenderingCommand`
- `WebTableColumnRenderer class >> titled: aTitle renderingItemWith: aRenderingCommand summarizedWith: aFooterRenderingCommand `
- `WebTableColumnRenderer class >> untitledRenderingItemWith: aRenderingCommand`
- `WebTableColumnRenderer class >> untitledRenderingItemWith: aRenderingCommand summarizedWith: aFooterRenderingCommand`

The following classes and methods has been removed (in the future they will be superseded by new funcionality)
- `WebTableMultiColumnRenderer`
- `TableWebViewBuilder >> #addColumnTitled:renderingAll:`
- `TableWebViewBuilder >> #addColumnTitled:renderingAll:applyingToCells:applyingToHeading:`
