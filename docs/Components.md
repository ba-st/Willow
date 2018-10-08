# Components

Willow supports the idea of renderable components providing access to interaction affordances. To render any Willow component just instruct a Seaside rendering canvas to render it:
```smalltalk
aCanvas render: component.
```

The creation of new components is abstracted away in a façade: the component supplier. When you declare a Willow Application, one of the essential subclass responsibilities you have to implement is providing a component supplier to be used in the app. The base Willow support includes an HTML5 supplier, but if you load other projects on the ecosystem you can get access to Bootstrap, Semantic UI & JQuery UI suppliers.

The supplier provides access to the components in a well defined API to ease the transition between one front-end framework and another. All the interactive components created by the supplier support `#onTrigger`, to access the interaction affordances. You can access the installed component supplier by sending the message `componentSupplier` to an instance of any component (Willow or Seaside, subclass of `WAPainter`).

## Fields

You can get a text field by doing:

```smalltalk
  subjectField := self componentSupplier singleLineTextFieldApplying: [].
  messageField := self componentSupplier multiLineTextFieldApplying: [].
```
depending if you want a single line text field or multi line one.

You will usually have your own components composing more basic ones. With Willow components it's usually a good idea to create the needed sub-components when you're initializing your own, and then just render them as part of the rendering of the larger component:

```smalltalk
MyComponent>>initialize

  super initialize.
  subjectField := self componentSupplier singleLineTextFieldApplying: [].
  subjectField onTrigger serializeIt.
  messageField := self componentSupplier multiLineTextFieldApplying: [].
  messageField onTrigger serializeIt.

MyComponent>>renderContentOn: html

  html render: subjectField.
  html break.
  html render: messageField
```  

You can also use some modification commands. For example:

```smalltalk
self componentSupplier
  singleLineTextFieldApplying: [:field | field setPlaceholderTo: 'johndoe@example.com'].
```

will produce a field than once rendered will offer as hint "johndoe@example.com".

> `[:component | component command ]` can be used to evaluate configuration commands that modify the component behavior. This will be covered in the Commands section.

All the field components support a clear programmatic API:
- `changeContentsTo: aText` will change the field contents to the provided text
- `contents` will return the contained text
- `notifyChangesTo:` can be used to subscribe for receiving a notification when the field content changes

There's also a date field component (`self componentSupplier dateFieldApplying: []`), which supports the messages `changeDateTo: aData` and `date` to set and retrieve the contained date respectively.

Also there is protocol for numeric fields:
- `decimalNumberFieldApplying:` accepting decimal numbers
- `naturalNumberFieldApplying:` accepting natural numbers

both support the `changeNumberTo:` and `number` API performing the necessary convertion.

## Selection

### Single Selection

There's a variety of single selection components to choose. All of them support the same Selection API:
- `currentSelection` returns the object selected, or raises `SelectionIsInvalid` in case there's none
- `currentSelectionIfNone:` returns the object selected, or evaluates the provided block in case there's none
- `withCurrentSelectionDo:` evaluates the provided block with the current selection, if available
- `allowAnyOf:` allows to configure the available list of objects, tries to keep the current selection if possible
- `disallowAll` cleans up the available list, and invalidates the selection
- `chooseEqualTo:` chooses the object from the list equal to the provided one, in case none matches it raises `SelectionIsInvalid`
- `chooseAny`: If the available list is not empty select some object of it
- `chooseAnySatisfying:ifNone:` choose any object satisfying the condition block, if none matches evaluate the alternative block
- `allowsAnySatisfying:` returns true if some object matching the provided criteria is in the available list
- `notifyChangesTo:` can be used to subscribe for receiving a notification when the selection changes

The component supplier supports several single selection components:
- `dropdownListApplying:` will provide a dropdown list
- `singleSelectionListBoxDisplayingAtOnce:applying:` will provide a list box
- `radioRenderingWith:applyingToLabel:applyingToInput:` will provide a group of radio boxes

### Multiple Selection

The base support on Willow provides only one component for multiple selection, but this can be extended in the dependent projects:
- `multipleSelectionListBoxDisplayingAtOnce:applying:` will provide a list box

This component supports the following API:

- `currentSelection` returns the collection of selected objects
- `allowAnyOf:` allows configuring the available list of objects, tries to keep the current selection if possible
- `disallowAll` cleans up the available list, and sets the current selection as empty
- `chooseAll` sets the current selection to the available object list
- `chooseAllIn:` sets the current selection to the objects provided
- `chooseAllMatching:` sets the current selection to the objects in the available list matching the criteria
- `allowsAnySatisfying:` returns true if some object matching the provided criteria is in the available list
- `notifyChangesTo:` can be used to subscribe for receiving a notification when the selection changes

### Binary Choice

These components for single selection only allow choosing between 2 values:
- `checkboxUnlabeledOnModel:offModel:applying:`
- `checkboxLabeled:onModel:offModel:applying:`

They support the following API:
- `currentSelection` returns the object selected. It cannot fail because conceptually there's no way to have an invalid selection
- `toggleCurrentSelection` toggles the current selection between the two available options
- `selectOnModel` sets the current selection to the object bound as the on state
- `selectOffModel` sets the current selection to the object bound as the off state
- `allows:` returns true if the provided object is one of the two options
- `notifyChangesTo:` can be used to subscribe for receiving a notification when the selection changes

## Command input

These components are the ones supporting user actions. The base support includes:
- `asynchronicButtonLabeled:applying:` provides a push button (a button without default behavior)
- `asynchronicLinkLabeled:applying:` provides an anchor
- `synchronicButtonLabeled:applying:evaluating:` provides a submit button

## Containers

Specific containers can be provided in specific component suppliers. Others are portable across all fronted frameworks, so they can be used directly. The base support includes:
- `unorderedListApplying:listing:applyingToEach:` will return an unordered list
- `tableBuilder` will provide a builder to create tables (See [Tabular Data](TabularData.md) for details)
- `GenericContainerWebView` will provide a `div` with interaction affordances
- `PhrasingContainerWebView` will provide a `span` with interaction affordances
- `IdentifiedWebView` will provide a `div`, `span`, `form` , `row` or `fieldset` with interaction affordances. It also guarantees that it will include an `id`, to be used when the component needs to be identified (for example in a re-rendering).
- `fieldSetContaining:applying:withLegend:applying:` will provide a `fieldset`
- `HeadingWebView` will provide a `h1`, `h2`, etc

Other projects in the ecosystem provide additional containers like grids, dialogs and panels/cards.

## Miscellaneous components

- `ImageWebView` will provide an `img`  with interaction affordances
- `LabeledWebView` will help displaying a `label` bound to a field

Other projects in the ecosystem provide additional componentes likes Tabs, Pills and Navigation.

## Advanced Components

### Delayed Views

You can get a delayed view from the component supplier by sending  `delayedViewShowing:whileEvaluating:thenRendering:`. This will provide a component that will show a spinner or throbber while performing a server call and rendering back the result when complete.

### Periodical Rendering

`PeriodicallyRenderedWebView` provides support to automatically render a view after a period of time, consulting the server for the updated content. A typical use case is in self refreshing Dashboard widgets.

## Commands

Almost all Willow components provide a command interface to further configure them. Every time you see the `applying:` keyword as part of a component message, you can use the command interface. Some commands are general and can be applied to any component, while some are specific.

For example, you can convert a basic text field into a password one using the following command:

```smalltalk
  self componentSupplier singleLineTextFieldApplying: [:field | field bePasswordInput]
```
so when you render the component you will get:

```html
<input type="password">
```

You can also use the command interface on plain Seaside code by sending: `apply:` or `with:applying:`, for example:

```smalltalk
html textInput apply: [:field | field setMaximumLenghtTo: 15]
```
will produce

```html
<input type="text" maxlength="15">
```

### Field related commands

- `beDateInput` will change the input type to "date"
- `beEmailInput` will change the input type to "email"
- `beEmailInput` will change the input type to "number"
- `bePasswordInput` will change the input type to "password"
- `beTextInput` will change the input type to "text"
- `setMaximumLengthTo:` will set the `maxlength` attribute to the provided value
- `setNameTo:` will set the `name` attribute to the provided value
- `setPlaceholderTo:` will set the `placeholder` attribute to the provided value

### Single selection commands

- `deselectAllOptions` will set the `selectedIndex` attribute to `-1`

### More general commands
- `beAutofocused` will set the `autofocus` attribute
- `beDisabled` will set the `disabled` attribute
- `beReadOnly` will set the `readonly` attribute
- `beRequired` will set the `required` attribute
- `boundBetween:and:` will set the `min` and `max` attributes to the provided range
- `boundNotNegative` will set the `min` attribute to `0`.
- `disableTabCycle` will set the `tabindex` attribute to `-1`
- `setTabIndexTo:` will set the `tabindex` attribute to the provided value
- `setAttribute:to:` will set the corresponding attribute to the provided values
- `setData:to:` particular case setting `data-*` attributes
- `setARIAAttribute:to:` particular case setting `aria-*` attributes
- `setARIARoleTo:` particular case setting the `role` atrribute looking up for valid aria role constants.
- `setTitleTo:` will set the `title` attribute to the provided value
- `labelItemsWith:` will configure the label block of the underlying brush (See implementors of `labels:`)
- `setCallbackTo:` will configure the `callback` block on the brush

### Styling and classes

The `setStyleTo:` command allows you to use [RenoirSt](https://github.com/ba-st/RenoirSt) facilities to declare inline styles. For example:
```smalltalk
  self componentSupplier singleLineTextFieldApplying:
    [:field | field setStyleTo: [:style |
      style
        backgroundColor: #aliceBlue;
        margin: 20 px ]
    ]
```

will produce

```html
<input type="text" style: "background-color: aliceblue;margin: 20px;">
```

You can also easily add classes (usually provided by the frontend framework in use), so for example if you have the bootstrap extensions you can do:
```smalltalk
html  
  div
    with: [ html text: 'Hi!']
    applying: [:container | container addClass bootstrap backgroundInfo]
```
and get
```html
<div class="bg-info">Hi!</div>
```

### Scripting

The `addScript` command allows attaching a script to a component. This is used in combination with some JQuery plugins:

```smalltalk
self componentSupplier singleLineTextFieldApplying:
  [:field | field addScript js: [:canvas | canvas jQuery this bootstrapModel ] ]
```
will get a script attached to the field.

### Advanced commands

You can combine several commands on the same component by sending `+`:

```smalltalk
  self componentSupplier singleLineTextFieldApplying:
    [:field | field beReadOnly + field addClass willow ]
```
will produce
```html
<input type="text" readonly class="willow"/>
```

The commands can also be applied only when some condition is met by sending `when:apply:`

```smalltalk
html div apply: [:pane | pane when: [ self isFirstTab ] apply: pane addClass bootstrap active ]
``` 
