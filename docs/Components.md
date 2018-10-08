# Components

Willow supports the idea of renderable components providing access to interaction affordances. To render any Willow component just instruct a Seaside rendering canvas to render it:
```smalltalk
aCanvas render: component.
```

The creation of new components it's abstracted away in a façade: the component supplier. When you declare a Willow Application, one of the essential subclass responsibilities you have to implement it's providing a component supplier to be used in the app. The base Willow support includes an HTML5 supplier, but if you load other projects on the ecosystem you can get access to Bootstrap, Semantic UI & JQuery UI suppliers.

The supplier provides access to the components in a well defined API to ease the transition between one frontend framework and another. The interactive components created by the supplier all supports `#onTrigger` to enable the user the access to interaction affordances. You can access the installed component supplier by sending the message `componentSupplier` to an instance of any component (Willow or Seaside).

## Fields

You can get a text field by doing:

```smalltalk
  subjectField := self componentSupplier singleLineTextFieldApplying: [].
  messageField := self componentSupplier multiLineTextFieldApplying: [].
```
depending if you want a single line text field or multiline text field.

Usually you have your own components holding more basic ones. With Willow components it's usually a good idea to create the needed sub-components when you're initialization your own, and later just render them as part of the rendering of the whole:

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

You can also use some modification commands, for example:

```smalltalk
self componentSupplier
  singleLineTextFieldApplying: [:field | field setPlaceholderTo: 'johndoe@example.com'].
```

will produce a component than when gets rendered will include "johndoe@example.com" as the ghosting text for the field.

> `[:component | component command ]` can be used to evaluate some configuration commands that modifies the component behavior, but we will see it in the Commands section.

All the field components support a clear programmatic API:
- `changeContentsTo: aText` will change the field contents to the provided text
- `contents` will return the contained text
- `notifyChangesTo:` can be used to subscribe for receiving a notification when the field content change

There's also a date field component (`self componentSupplier dateFieldApplying: []`), this component supports the messages `changeDateTo: aData` and `date` to set and retrieve the contained date.

Also there's some number field options:
- `decimalNumberFieldApplying:` accepting decimal numbers
- `naturalNumberFieldApplying:` accepting natural numbers

both supporting the `changeNumberTo:` and `number` API performing the necessary convertion.

## Selection

### Single Selection

There's a variety of single selection components to choose. All of them support the same Selection API:
- `currentSelection` returns the object selected, or raises `SelectionIsInvalid` in case there's no one
- `currentSelectionIfNone:` returns the object selected, or evaluates the provided block in case there's no one
- `withCurrentSelectionDo:` evaluates the provided block with the current selection if available
- `allowAnyOf:` allows to configure the available list of objects, tries to keep the current selection if possible
- `disallowAll` clean up the available list, and invalidates the selection
- `chooseEqualTo:` chooses the object from the list equal to the provided one, in case no one matches raises `SelectionIsInvalid`
- `chooseAny`: If the available list is not empty select some object of it
- `chooseAnySatisfying:ifNone:` choose any object satisfying the condition block, if none matches evaluate the alternative block
- `allowsAnySatisfying:` returns true if some object matching the provided criteria is in the available list
- `notifyChangesTo:` can be used to subscribe for receiving a notification when the selection change

The component supplier supports several single selection components:
- `dropdownListApplying:` will provide a dropdown list
- `singleSelectionListBoxDisplayingAtOnce:applying:` will provide a list box
- `radioRenderingWith:applyingToLabel:applyingToInput:` will provide a group of radio boxes

### Multiple Selection

The base support on Willow provides only one component for multiple selection, but this can be extended in the dependent projects:
- `multipleSelectionListBoxDisplayingAtOnce:applying:` will provide a list box

This components supports the following API:

- `currentSelection` returns the collection of selected objects
- `allowAnyOf:` allows to configure the available list of objects, tries to keep the current selection if possible
- `disallowAll` clean up the available list, and set the current selection as empty
- `chooseAll` set the current selection as the available object list
- `chooseAllIn:` set the current selection as the objects provided
- `chooseAllMatching:` set the current selection as the objects in the available list matching the criteria
- `allowsAnySatisfying:` returns true if some object matching the provided criteria is in the available list
- `notifyChangesTo:` can be used to subscribe for receiving a notification when the selection change

### Binary Choice

Some components of single selection just allows to choose between 2 values:
- `checkboxUnlabeledOnModel:offModel:applying:`
- `checkboxLabeled:onModel:offModel:applying:`

supporting the following API:
- `currentSelection` returns the object selected. It cannot fail because conceptually there's no way to have an invalid selection
- `toggleCurrentSelection` toggles the current selection between the two available options
- `selectOnModel` set as current selection the object bound to the on state
- `selectOffModel` set as current selection the object bound to the off state
- `allows:` returns true if the provided object is one of the two options
- `notifyChangesTo:` can be used to subscribe for receiving a notification when the selection change

## Command input

These components are the ones supporting user actions. The base support includes:
- `asynchronicButtonLabeled:applying:` provides a push button (a button without default behavior)
- `asynchronicLinkLabeled:applying:` provides an anchor
- `synchronicButtonLabeled:applying:evaluating:` provides a submit button

## Containers

Some containers are provided within the component supplier and other are just portable across all fronted frameworks so it can be used directly. The base support includes:
- `unorderedListApplying:listing:applyingToEach:` will return an unordered list
- `tableBuilder` will provide a builder to create tables (See [Tabular Data](TabularData.md) for details)
- `GenericContainerWebView` will provide a `div` with interaction affordances
- `PhrasingContainerWebView` will provide a `span` with interaction affordances
- `IdentifiedWebView` will provide a `div`, `span`, `form` , `row` or `fieldset` with interaction affordances and giving guarantees that it will include an `id` so it can be used when the component needs to be identified.
- `fieldSetContaining:applying:withLegend:applying:` will provide a `fieldset`
- `HeadingWebView` will provide a `h1`, `h2`, etc

Other projects in the ecosystem provides other kind of containers like grids, dialogs and panels/cards.

## Miscellaneous components

- `ImageWebView` will provide an `img`  with interaction affordances
- `LabeledWebView` will help displaying a `label` bound to a field

Other projects in the ecosystem provides other kind of componentes likes Tabs, Pills or Navigation.

## Advanced Components

### Delayed Views

You can get from the component supplier a delayed view with: `delayedViewShowing:whileEvaluating:thenRendering:`. This will provide a component that when gets rendered will show a spinner or throbber, while performing a server call and rendering back the result when complete.

### Periodical Rendering

`PeriodicallyRenderedWebView` provides support to render automatically a view after a period of time consulting the server for updates. A typical usecase is a Dashboard widget.

## Commands

Almost all Willow components provides a command interface to further configure them. Every time you see some kind of `applying:` keyword you can use the command interface. Some commands are general and can be applied to any component, and some are specific.

For example you can convert a basic text field into a password one using the following command:

```smalltalk
  self componentSupplier singleLineTextFieldApplying: [:field | field bePasswordInput]
```
so when you render the component you will get

```html
<input type="password">
```

You can also use the command interface on plain Seaside code by sending: `apply:` or `with:applying:`. So for example

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
- `setMaximumLenghtTo:` will set the `maxlenght` attribute to the provided value
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

The `addScript` command allows to attach some script to a component. For example this is used in combination with some JQuery plugins:

```smalltalk
self componentSupplier singleLineTextFieldApplying:
  [:field | field addScript js: [:canvas | canvas jQuery this bootstrapModel ] ]
```
so you will get a script attached to the field.

### Advanced commands

You can combine several commands for the same component using `+`:

```smalltalk
  self componentSupplier singleLineTextFieldApplying:
    [:field | field beReadOnly + field addClass willow ]
```
will produce
```html
<input type="text" readonly class="willow"/>
```

The commands can also be applied only when some condition is met by using `when:apply:`:

```smalltalk
html div apply: [:pane | pane when: [ self isFirstTab ] apply: pane addClass bootstrap active ]
``` 
