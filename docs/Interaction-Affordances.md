# Interaction Affordances

Each interactive component in Willow supports the `#onTrigger` message, that provides access to the interaction affordances. It basically attachs an event handler function to the corresponding DOM element, whose code depends on what interaction affordances are used. So lets see a simple example not involving server aware code:

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
- DOM Interaction
  - `enable:`
  - `disable`
  - `focus:`
  - `focusUsing:`
  - `remove:`
  - `render:`
  - `renderAll:`
  - `setValueTo:thenTriggerChangeOf:`
  - `setValueTo:withoutTriggeringChangeOnComponentWithId:`
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

![Combined Interaction](images/Server Evaluation.gif)

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

There's also support for performing the AJAX call only when some condition is met. You can use `onlyWhen:determineBehaviorByEvaluating:with:` for that and passing an string representing the javascript condition you want to evaluate before the call is made (This will improve in the future).

## Serialization

The kind of applications you do with Willow will not perform a page submit. So when working with form elements the contents must be serialized in an AJAX call so the server components have the updated values. Depending on the interactivity level you want in your application you have several options.

Lets see an example:
```smalltalk
button onTrigger serializeContainerForm
```
the handler function will look like:
```javascript
function(event) {
  Willow.callServer({
    "type": "POST",
    "url": "/app",
    "data": ["_s=I9CKSDJSLDAiicmC", "_k=KXMnjdjd112JJJ" , "57" ,
              $(this).closest("form").find(".input").serialize()
            ]
  })
}
```
![Combined Interaction](images/Form Serialization.gif)

In this case when a button is clicked all the input information inside the closest form to the button will be serialized and sent to the server. So if you combine in this call an `evaluate:` the server components will have the updated values before evaluating the callback.

The main difference between the serialization affordances is what get serialized. So:
- `serializeContainerForm` will find the form closest to the component receiving the onTrigger message
- `serializeChildrenForm` will find a form in the children of the component receiving the onTrigger message
- `serializeForm:` will find an specific form using its #id
- `serializeIt` will serialize the component receiving the onTrigger message (usually you used this in tandem with some field component and triggering on the change event)
- `serializeWithHiddenInputs` will serialize the component receiving the onTrigger message and the next hidden input (for some seaside brushes the resulting HTML includes a hidden input to match later the real objects)

In case you need it there's also support to submit a form: `submitForm:` and `submitFormStyledAs:` will call the `submit()` function on the corresponding form (found by id or by matching it's "class").

## DOM Interaction

### Rendering

The `render:` affordance is one of the most useful ones. You can replace portions of the DOM with new elements that will be rendered by the server and returned as part of the payload of the AJAX call response.

Let's see an example:
```smalltalk
currentTimeView := IdentifiedWebView
        forSpanNamed: 'current-time'
        containing: [ :canvas | canvas strong: Time now ].
button onTrigger render: currentTimeView
```
This will configure the handler function bound to the button click event to perform an AJAX call and when the call is complete it will replace the DOM contents of the component with some updated rendering.

![Combined Interaction](images/Rendering.gif)

Inspecting the response payload of the AJAX call yo would see something like:
```javascript
$("#current-time-id12").html("<strong>16:58:33</strong>")
```

In case you want to render several views at once you can use `renderAll:`.

You can also show some kind of spinner or throbber while the AJAX call to render a view is in progress. For that use `show:whileCallingServerToRender:`, so for example:

```smalltalk
button show: 'Searching...' whileCallingServerToRender: container
```
will yield something like

```javascript
function(event) {
  $("#container-id").html("Searching...");
  Willow.callServer({
      "url": "/app",
      "data": ["_s=I9CKSDJSLDAiicmC", "_k=KXMnjdjd112JJJ" , "21"]
  })
}
```

So it will show "Searching..." in the container place while the AJAX call is performed and when it returned will replace the contents again with the new rendering.

### Enable/disable

You can disable a component in the DOM by using `disable`, so for example:

```smalltalk
button onTrigger disable
```
will yield the following handler function:
```javascript
function(event) {
  $(this).prop("disabled", true)
}
```
That will disable the button when clicked.

You can also enable a component by using `enable:`

### Focus

By using `focus:` and `focusUsing:` you can call `focus()` on a DOM element when returning from the AJAX call. You can also use `scrollIntoView:` and this will call `scrollIntoView()` instead of `focus()`.

### Remove

By using `remove:` you can remove an element from the DOM (calling `remove()`) when returning from the AJAX call.

### Setting input values

You can set an input value (without replacing the DOM element) by using `setValueTo:thenTriggerChangeOf:` and `setValueTo:withoutTriggeringChangeOnComponentWithId:`. This will perform an AJAX call to the server to get the new value and update it in the input. Depending on the affordance in use will trigger the change event or not.

## Combining Interactions

You can combine several affordances in the same `onTrigger` so they will end up in the same handler function. For example:

```smalltalk
runSelectedTestsButton onTrigger
        transform: testResult into: SpinKitTripleBounce new;
        evaluate: [ self session runTests ];
        render: testResult.
```

will show a spinner, perform an AJAX call, the server will process the callback running some tests and when the AJAX call is complete it will render again the updated test result.

![Combined Interaction](images/Combined Interactions.gif)