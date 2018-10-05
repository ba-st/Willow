# Interaction Affordances

Each interactive component in Willow supports the `#onTrigger` message, that provides access to the interaction affordances. It basically attachs and event handler function to the corresponding DOM element, whose code depends on what interaction affordances are used. So lets see a simple example not involving server aware code:

```smalltalk
button onTrigger
  executeOnClient: [:canvas |
    canvas javascript alert: 'Hello World!'
  ]
```
When the button gets rendered into the DOM it will attach an event handler to the `<button>` for the `click` event having as a handler function:

```javascript
function(event) {
  alert("Hello World!")
}
```

The event that gets bound depends on the type of component used:
- `click`
  - Button
  - Link
  - Check Box
  - Image
  - Container (`div` or `span`)
  - Table
  - List
- `change`
  - Single line Text Field
  - Multi line Text Field
  - Date Field
  - Number Field
  - Multiple Selection List Box
  - Single Selection List Box
  - Drop Down List
  - Radio Button
- `keyup`
  - Single line Text Field
  - Multi line Text Field

## Summary
- General
  - `executeOnClient:`
  - `evaluate:`
  - `evaluate:with:`
  - `determineBehaviorByEvaluating:`
  - `determineBehaviorByEvaluating:with:`
  - `onlyWhen:determineBehaviorByEvaluating:with:`
- Serialization
  - `serializeChildrenForm`
  - `serializeContainerForm`
  - `serializaForm:`
  - `serializeIt`
  - `serializeWithHiddenInputs`
  - `submitForm:`
  - `submitFormStyledAs:`
- DOM Manipulation
  - `enable:`
  - `disable`
  - `focus:`
  - `focusUsing:`
  - `remove:`
  - `render:`
  - `renderAll:`
  - `setValueTo:thenTriggerChangeOf:`
  - `setValutTo:withoutTriggeringChangeOnComponentWithId:`
  - `show:whileCallingServerToRender:`
  - `temporarilyDisableAndTransform:into:`
  - `temporarilyDisableAndTransformInto:`
  - `transform:into:`
  - `scrollIntoView:`
  - `showLoadingNotificationStyledAsAll:`
- CSS Manipulation
  - `addCssClass:`
  - `addCssClass:toComponentsMatching:`
  - `changeCssClass:to:`
  - `removeCssClass:fromComponentsMatching:`
  - `removeCssClass:fromComponentsWithClass:`
  - `toggleCssClass:`
  - `toggleCssClass:on:`
  - `toggleCssClass:onComponentsMatching:`
- Dialogs
  - `open:`
  - `closeLastDialog`
  - `closeAllDialogs`
- Debugging
  - `confirmAsking:`
  - `inform:`
  - `informSelection`

## General Affordances
### Client Execution

This affordance allows you to configure some javascript to be run in the browser without interaction with the server. We already saw an example.

It uses the Seaside javascript generation support and it's usually used as a basic building block to do more complex behavior on top.

### Server Evaluation

This affordance allows you to configure an AJAX call bound to a callback on the server. So, for example:

```smalltalk
button onTrigger
  evaluate: [
    'The button was clicked on the browser' inspect
  ]
```
will yield the following handler function (or something like that):
```javascript
function(event) {
  Willow.callServer({
    "url": "/app",
    "data": ["_s=I9CKSDJSLDAiicmC", "_k=KXMnjdjd112JJJ" , "21"]
  })
}
```
where `Willow.callServer` it's built on top of standard AJAX support, configuring some basic stuff including the error handling.

This AJAX function has a counterpart callback on the server that will evaluate the user provided block.

Sometimes you want to do some conditional stuff when the AJAX call returns to the browser. You can do that using `determineBehaviorByEvaluating:`. This affordance is similar to `evaluate:` but injects into the block a response object that you can use to configure additional behavior to happen in the browser when the AJAX call returned.
For example:
```smalltalk
button onTrigger determineBehaviorByEvaluating: [:response |
    self someServerSideCondition
      ifTrue: [ response onReturn inform: 'Condition is true' ]
  ]
```
will yield a handler function similar to evaluate, but if the condition is true when the block is evaluated in the server, the AJAX call response will include code to display an `alert` showing "Condition is true".

Doing `response onReturn` you can use any interaction affordance available to `onTrigger`.

### Server Evaluation with client parameters

Sometimes you need to send additional information to the server (not necessarily user input), so there's a couple of affordances for that: `evaluate:with:` and `determineBehaviorByEvaluating:with:`.

Lets see an example:
```smalltalk
button onTrigger
  evaluate: [:theUserAgent | self saveIt: theUserAgent ]
  with: (JSStream on: 'navigator') access: 'userAgent'
```
the handler function will look similar to:
```javascript
function(event) {
  Willow.callServer({
    "type": "POST",
    "url": "/app",
    "data": ["_s=I9CKSDJSLDAiicmC", "_k=KXMnjdjd112JJJ" , "2" , "3=" +
      encodeURIComponent(JSON.stringify(navigator.userAgent))]
  })
}
```
and when the callback is evaluated in the server you will get in the block parameter (`theUserAgent`) an object (produced by using `WAJsonParser`) with the information sent in the call.
