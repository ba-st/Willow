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

## Command input

## Containers

## Misc components

## Advanced Components

## Commands
