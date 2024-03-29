Class {
	#name : #WebInteractionInterpreterTest,
	#superclass : #BWRenderingTest,
	#pools : [
		'Willow'
	],
	#category : #'Willow-Core-Tests-WebInteraction'
}

{ #category : #'test support' }
WebInteractionInterpreterTest >> changeInterpreter [

	^ WebInteractionInterpreter calling: #change serializingWith: SerializationCommand forCurrentObject
]

{ #category : #'test support' }
WebInteractionInterpreterTest >> clickInterpreter [

	^ WebInteractionInterpreter calling: #click serializingWith: NullWebInteractionCommand new
]

{ #category : #'test support' }
WebInteractionInterpreterTest >> configureTextInputWith: interpreter [

	^ self apply: interpreter toComponentDefinedBy: [ :canvas | canvas textInput ]
]

{ #category : #'tests - Configuring - CSS' }
WebInteractionInterpreterTest >> testAddCssClass [

	| interpreter html |

	interpreter := self clickInterpreter.
	interpreter updateCssClasses: [ :classes | classes addClass: Classification >> #willow ].
	html := self configureTextInputWith: interpreter.
	self
		assert: html
		equals:
			'<input id="input-id1" type="text"/><script type="text/javascript">$("#input-id1").click(function(event){$(this).addClass("willow")});</script>'
]

{ #category : #'tests - Configuring - CSS' }
WebInteractionInterpreterTest >> testAddCssClassToComponentsMatching [

	| interpreter html |

	interpreter := self clickInterpreter.
	interpreter
		updateCssClasses: [ :classes | classes addClass: Classification >> #willow ]
		onElementsMatching: [ :canvas | canvas jQuery class: 'aComponentByStyleName' ].
	html := self configureTextInputWith: interpreter.
	self
		assert: html
		equals:
			'<input id="input-id1" type="text"/><script type="text/javascript">$("#input-id1").click(function(event){$(".aComponentByStyleName").addClass("willow")});</script>'
]

{ #category : #'tests - Configuring' }
WebInteractionInterpreterTest >> testAjaxCallsEvaluateTheBlock [

	| interpreter evaluated |

	interpreter := self clickInterpreter.
	evaluated := false.
	interpreter serverDo: [ evaluated := true ].
	self
		renderUsing: [ :canvas | 
			| component |

			component := canvas textInput.
			interpreter applyTo: component on: canvas.
			self executeAjaxCallbacksOn: canvas
			].
	self assert: evaluated
]

{ #category : #'tests - evaluating' }
WebInteractionInterpreterTest >> testApplyToOn [

	| interpreter html |

	interpreter := WebInteractionInterpreter
		calling: #dblclick
		serializingWith: NullWebInteractionCommand new.
	interpreter inform: 'A message'.

	html := self renderUsing: [ :canvas | interpreter applyTo: canvas textInput on: canvas ].
	self
		assert: html
		equals:
			'<input id="input-id1" type="text"/><script type="text/javascript">$("#input-id1").dblclick(function(event){alert("A message")});</script>'
]

{ #category : #'tests - Instance Creation' }
WebInteractionInterpreterTest >> testCallingSerializingWith [

	| interpreter html |

	interpreter := WebInteractionInterpreter
		calling: #dblclick
		serializingWith: NullWebInteractionCommand new.
	interpreter inform: 'A message'.
	html := self configureTextInputWith: interpreter.
	self
		assert: html
		equals:
			'<input id="input-id1" type="text"/><script type="text/javascript">$("#input-id1").dblclick(function(event){alert("A message")});</script>'
]

{ #category : #'tests - Configuring - CSS' }
WebInteractionInterpreterTest >> testChangeCssClassTo [

	| interpreter html |

	interpreter := self clickInterpreter.
	interpreter
		updateCssClasses: [ :classes | 
			classes
				removeClass: Classification >> #loading;
				addClass: Classification >> #willow
			]
		onElementsMatching: [ :canvas | canvas jQuery class: Classification >> #loading ].
	html := self
		apply: interpreter
		toComponentDefinedBy: [ :canvas | canvas textInput apply: [ :input | input addClass loading ] ].
	self
		assert: html
		equals:
			'<input class="willow-loading" id="input-id1" type="text"/><script type="text/javascript">$("#input-id1").click(function(event){$(".willow-loading").removeClass("willow-loading").addClass("willow")});</script>'
]

{ #category : #'tests - Configuring - Dialogs' }
WebInteractionInterpreterTest >> testCloseAllDialogs [

	| interpreter html |

	interpreter := self clickInterpreter.
	interpreter closeAllDialogs.
	html := self configureTextInputWith: interpreter.
	self
		assert: html
		equals:
			'<input id="input-id2" type="text"/><script type="text/javascript">$("#input-id2").click(function(event){Willow.callServer({"url":"/","data":"1"})});</script>'
]

{ #category : #'tests - Configuring - Dialogs' }
WebInteractionInterpreterTest >> testCloseLastDialog [

	| interpreter html |

	interpreter := self clickInterpreter.
	interpreter closeLastDialog.
	html := self configureTextInputWith: interpreter.
	self
		assert: html
		equals:
			'<input id="input-id2" type="text"/><script type="text/javascript">$("#input-id2").click(function(event){Willow.callServer({"url":"/","data":"1"})});</script>'
]

{ #category : #'tests - Configuring - DOM' }
WebInteractionInterpreterTest >> testConfirmAsking [

	| interpreter html |

	interpreter := self clickInterpreter.
	interpreter confirmAsking: 'Continue?'.
	html := self configureTextInputWith: interpreter.
	self
		assert: html
		equals:
			'<input id="input-id2" type="text"/><script type="text/javascript">$("#input-id2").click(function(event){if(confirm("Continue?")){Willow.callServer({"url":"/","data":"1"})}});</script>'
]

{ #category : #'tests - Configuring - Serialization' }
WebInteractionInterpreterTest >> testConflictingSerializationCommandsAreNotAllowed [

	| interpreter id |

	interpreter := self changeInterpreter.
	id := '15'.

	self
		renderUsing: [ :canvas | 
			| textInput |

			textInput := canvas textInput.
			textInput id: id.
			interpreter
				serverDo: [  ];
				serializeWithHiddenInputs.

			self
				should: [ interpreter applyTo: textInput on: canvas ]
				raise: ConflictingObjectFound
				withMessageText: 'Found 2 commands specifying serialization using forCurrentObject'
			]
]

{ #category : #'tests - Configuring - DOM' }
WebInteractionInterpreterTest >> testDisable [

	| interpreter html id |

	interpreter := self changeInterpreter.
	id := '15'.

	html := self
		renderUsing: [ :canvas | 
			| textInput |

			textInput := canvas textInput.
			textInput id: id.
			interpreter disable.
			interpreter applyTo: textInput on: canvas
			].

	self
		assert: html
		equals:
			'<input id="15" type="text"/><script type="text/javascript">$("#15").change(function(event){$(this).prop("disabled",true)});</script>'
]

{ #category : #'tests - Configuring - DOM' }
WebInteractionInterpreterTest >> testEnable [

	| interpreter html id |

	interpreter := self changeInterpreter.
	id := '15'.

	html := self
		renderUsing: [ :canvas | 
			| textInput |

			textInput := canvas textInput.
			textInput id: id.
			interpreter enable: textInput.
			interpreter applyTo: textInput on: canvas
			].

	self
		assert: html
		equals:
			'<input id="15" type="text"/><script type="text/javascript">$("#15").change(function(event){$("#15").prop("disabled",false)});</script>'
]

{ #category : #'tests - Configuring - DOM' }
WebInteractionInterpreterTest >> testFocus [

	| interpreter html id |

	interpreter := self changeInterpreter.
	id := '15'.

	html := self
		renderUsing: [ :canvas | 
			| textInput |

			textInput := canvas textInput.
			textInput id: id.
			interpreter focus: textInput.
			interpreter applyTo: textInput on: canvas
			].

	self
		assert: html
		equals:
			'<input id="15" type="text"/><script type="text/javascript">$("#15").change(function(event){Willow.callServer({"url":"/","data":"1"})});</script>'
]

{ #category : #'tests - Configuring - DOM' }
WebInteractionInterpreterTest >> testFocusUsing [

	| interpreter html |

	interpreter := self changeInterpreter.

	interpreter focusUsing: [ :canvas | canvas jQuery this ].
	html := self apply: interpreter toComponentDefinedBy: [ :canvas | canvas textInput ].

	self
		assert: html
		equals:
			'<input id="input-id2" type="text"/><script type="text/javascript">$("#input-id2").change(function(event){Willow.callServer({"url":"/","data":"1"})});</script>'
]

{ #category : #'tests - Instance Creation' }
WebInteractionInterpreterTest >> testForEvaluationOfWithAll [

	| interpreter html |

	interpreter := WebInteractionInterpreter forEvaluationOf: #onBlur: withAll: #(firstThis thenThat).
	interpreter inform: 'The message is the medium'.
	html := self configureTextInputWith: interpreter.
	self assert: html equals: '<input onblur="function(firstThis,thenThat){alert(&quot;The message is the medium&quot;)}" type="text"/>'
]

{ #category : #'tests - Instance Creation' }
WebInteractionInterpreterTest >> testForInstantEvaluation [

	| interpreter html |

	interpreter := WebInteractionInterpreter forInstantEvaluation.
	interpreter serverDo: [  ].
	html := self configureTextInputWith: interpreter.
	self
		assert: html
		equals:
			'<input type="text"/><script type="text/javascript">Willow.callServer({"url":"/","data":"1"});</script>'
]

{ #category : #'tests - Configuring' }
WebInteractionInterpreterTest >> testInform [

	| interpreter html |

	interpreter := self clickInterpreter.
	interpreter inform: 'A message'.
	html := self configureTextInputWith: interpreter.
	self
		assert: html
		equals:
			'<input id="input-id1" type="text"/><script type="text/javascript">$("#input-id1").click(function(event){alert("A message")});</script>'
]

{ #category : #'tests - Configuring' }
WebInteractionInterpreterTest >> testInformSelection [

	| interpreter html |

	interpreter := self clickInterpreter.
	interpreter informSelection.
	html := self configureTextInputWith: interpreter.
	self
		assert: html
		equals:
			'<input id="input-id1" type="text"/><script type="text/javascript">$("#input-id1").click(function(event){alert($(this).children("option:selected").text())});</script>'
]

{ #category : #'tests - Configuring - Dialogs' }
WebInteractionInterpreterTest >> testOpen [

	| interpreter html |

	interpreter := self clickInterpreter.
	interpreter open: [ :canvas | canvas dialog attributeAt: 'open' put: true ].
	html := self configureTextInputWith: interpreter.
	self
		assert: html
		equals:
			'<input id="input-id2" type="text"/><script type="text/javascript">$("#input-id2").click(function(event){Willow.callServer({"url":"/","data":"1"})});</script>'
]

{ #category : #'tests - Configuring - DOM' }
WebInteractionInterpreterTest >> testRemove [

	| interpreter html id |

	interpreter := self changeInterpreter.
	id := '15'.

	html := self
		renderUsing: [ :canvas | 
			| textInput |

			textInput := canvas textInput.
			textInput id: id.
			interpreter remove: textInput.
			interpreter applyTo: textInput on: canvas
			].

	self
		assert: html
		equals:
			'<input id="15" type="text"/><script type="text/javascript">$("#15").change(function(event){Willow.callServer({"url":"/","data":"1"})});</script>'
]

{ #category : #'tests - Configuring - CSS' }
WebInteractionInterpreterTest >> testRemoveCssClassFromComponentsMatching [

	| interpreter html |

	interpreter := self clickInterpreter.
	interpreter
		updateCssClasses: [ :classes | classes removeClass: Classification >> #willow ]
		onElementsMatching: [ :canvas | canvas jQuery class: 'aComponentByStyleName' ].
	html := self configureTextInputWith: interpreter.
	self
		assert: html
		equals:
			'<input id="input-id1" type="text"/><script type="text/javascript">$("#input-id1").click(function(event){$(".aComponentByStyleName").removeClass("willow")});</script>'
]

{ #category : #'tests - Configuring - CSS' }
WebInteractionInterpreterTest >> testRemoveCssClassFromComponentsWithClass [

	| interpreter html |

	interpreter := self clickInterpreter.
	interpreter
		updateCssClasses: [ :classes | classes removeClass: Classification >> #loading ]
		onElementsMatching: [ :canvas | canvas jQuery class: Classification >> #willow ].
	html := self
		apply: interpreter
		toComponentDefinedBy: [ :canvas | canvas textInput apply: [ :input | input addClass loading + input addClass willow ] ].
	self
		assert: html
		equals:
			'<input class="willow-loading willow" id="input-id1" type="text"/><script type="text/javascript">$("#input-id1").click(function(event){$(".willow").removeClass("willow-loading")});</script>'
]

{ #category : #'tests - Configuring - DOM' }
WebInteractionInterpreterTest >> testRender [

	| interpreter html id |

	interpreter := self changeInterpreter.
	id := '15'.

	html := self
		renderUsing: [ :canvas | 
			| textInput container |

			textInput := canvas textInput.
			textInput id: id.
			container := ContainerWebView
				wrapping: [ :containerCanvas | containerCanvas render: id ]
				intoElementBuiltUsing: [ :theCanvas | theCanvas div ]
				applying: [  ].
			interpreter render: container.
			canvas render: container.
			interpreter applyTo: textInput on: canvas
			].

	self
		assert: html
		equals:
			'<input id="15" type="text"/><div id="container-id1">15</div><script type="text/javascript">$("#15").change(function(event){Willow.callServer({"type":"POST","url":"/","data":["2",$(this).serialize()].join("&")})});</script>'
]

{ #category : #'tests - Configuring - DOM' }
WebInteractionInterpreterTest >> testRenderAll [

	| interpreter html id |

	interpreter := self changeInterpreter.
	id := '15'.

	html := self
		renderUsing: [ :canvas | 
			| textInput container anotherContainer |

			textInput := canvas textInput.
			textInput id: id.
			container := ContainerWebView
				wrapping: [ :containerCanvas | containerCanvas render: id ]
				intoElementBuiltUsing: [ :theCanvas | theCanvas div ]
				applying: [  ].
			anotherContainer := ContainerWebView
				wrapping: [ :containerCanvas | textInput tag ]
				intoElementBuiltUsing: [ :theCanvas | theCanvas div ]
				applying: [  ].
			interpreter renderAll: ( Array with: container with: anotherContainer ).
			canvas
				render: container;
				render: anotherContainer.
			interpreter applyTo: textInput on: canvas
			].

	self
		assert: html
		equals:
			'<input id="15" type="text"/><div id="container-id1">15</div><div id="container-id2"></div><script type="text/javascript">$("#15").change(function(event){Willow.callServer({"type":"POST","url":"/","data":["3",$(this).serialize()].join("&")})});</script>'
]

{ #category : #'tests - Configuring - DOM' }
WebInteractionInterpreterTest >> testRenderIsAddedLast [

	| interpreter id |

	interpreter := self changeInterpreter.
	id := '15'.

	self
		renderUsing: [ :canvas | 
			| textInput container |

			textInput := canvas textInput.
			textInput id: id.
			container := ContainerWebView
				wrapping: [ :containerCanvas | containerCanvas render: id ]
				intoElementBuiltUsing: [ :theCanvas | theCanvas div ]
				applying: [  ].
			interpreter
				render: container;
				serverDo: [ id := 27 ].
			canvas render: container.
			interpreter applyTo: textInput on: canvas.
			self executeAjaxCallbacksOn: canvas
			].

	self assert: self requestContext response contents equals: '$("#container-id1").html("27")'
]

{ #category : #'tests - Configuring - DOM' }
WebInteractionInterpreterTest >> testScrollingIntoView [

	| interpreter html id |

	interpreter := self changeInterpreter.
	id := '15'.
	interpreter scrollingIntoView: id.
	html := self
		renderUsing: [ :canvas | 
			| textInput |

			textInput := canvas textInput.
			textInput id: id.
			interpreter applyTo: textInput on: canvas
			].

	self
		assert: html
		equals:
			'<input id="15" type="text"/><script type="text/javascript">$("#15").change(function(event){Willow.callServer({"url":"/","data":"1"})});</script>'
]

{ #category : #'tests - Configuring - Serialization' }
WebInteractionInterpreterTest >> testSerializeChildForm [

	| interpreter html id |

	interpreter := self changeInterpreter.
	id := '15'.

	html := self
		renderUsing: [ :canvas | 
			| textInput |

			textInput := canvas textInput.
			textInput id: id.
			interpreter serializeChildForm.
			interpreter applyTo: textInput on: canvas
			].

	self
		assert: html
		equals:
			'<input id="15" type="text"/><script type="text/javascript">$("#15").change(function(event){Willow.callServer({"type":"POST","url":"/","data":["1",$(this).children("form").serialize()].join("&")})});</script>'
]

{ #category : #'tests - Configuring - Serialization' }
WebInteractionInterpreterTest >> testSerializeContainerForm [

	| interpreter html id |

	interpreter := self changeInterpreter.
	id := '15'.

	html := self
		renderUsing: [ :canvas | 
			| textInput |

			textInput := canvas textInput.
			textInput id: id.
			interpreter serializeContainerForm.
			interpreter applyTo: textInput on: canvas
			].

	self
		assert: html
		equals:
			'<input id="15" type="text"/><script type="text/javascript">$("#15").change(function(event){Willow.callServer({"type":"POST","url":"/","data":["1",$(this).closest("form").find(":input").serialize()].join("&")})});</script>'
]

{ #category : #'tests - Configuring - Serialization' }
WebInteractionInterpreterTest >> testSerializeForm [

	| interpreter html id |

	interpreter := self clickInterpreter.
	id := '15'.

	html := self
		renderUsing: [ :canvas | 
			| form anchor |

			form := canvas form.
			form id: id.
			anchor := canvas anchor.
			anchor id: '16'.
			interpreter serializeForm: form.
			interpreter applyTo: anchor on: canvas
			].

	self
		assert: html
		equals:
			'<form accept-charset="utf-8" method="post" action="/" id="15"></form><a id="16"></a><script type="text/javascript">$("#16").click(function(event){Willow.callServer({"type":"POST","url":"/","data":["1",$("#15").serialize()].join("&")})});</script>'
]

{ #category : #'tests - Configuring - Serialization' }
WebInteractionInterpreterTest >> testSerializeIt [

	| interpreter html id |

	interpreter := self changeInterpreter.
	id := '15'.

	html := self
		renderUsing: [ :canvas | 
			| textInput |

			textInput := canvas textInput.
			textInput id: id.
			interpreter serializeIt.
			interpreter applyTo: textInput on: canvas
			].

	self
		assert: html
		equals:
			'<input id="15" type="text"/><script type="text/javascript">$("#15").change(function(event){Willow.callServer({"type":"POST","url":"/","data":["1",$(this).serialize()].join("&")})});</script>'
]

{ #category : #'tests - Configuring - Serialization' }
WebInteractionInterpreterTest >> testSerializeItTwiceIsNotAllowed [

	| interpreter |

	interpreter := self changeInterpreter.

	self
		renderUsing: [ :canvas | 
			| textInput |

			textInput := canvas textInput.
			interpreter
				serializeIt;
				serializeIt.

			self
				should: [ interpreter applyTo: textInput on: canvas ]
				raise: ConflictingObjectFound
				withMessageText: 'Found 2 commands specifying serialization using forCurrentObject'
			]
]

{ #category : #'tests - Configuring - Serialization' }
WebInteractionInterpreterTest >> testSerializeWithHiddenInputs [

	| interpreter html id |

	interpreter := self changeInterpreter.
	id := '15'.

	html := self
		renderUsing: [ :canvas | 
			| textInput |

			textInput := canvas textInput.
			textInput id: id.
			interpreter serializeWithHiddenInputs.
			interpreter applyTo: textInput on: canvas
			].

	self
		assert: html
		equals:
			'<input id="15" type="text"/><script type="text/javascript">$("#15").change(function(event){Willow.callServer({"type":"POST","url":"/","data":["1",$(this).next("input:hidden").addBack().serialize()].join("&")})});</script>'
]

{ #category : #'tests - Configuring' }
WebInteractionInterpreterTest >> testServerDo [

	| interpreter html |

	interpreter := self clickInterpreter.
	interpreter serverDo: [  ].
	html := self configureTextInputWith: interpreter.
	self
		assert: html
		equals:
			'<input id="input-id2" type="text"/><script type="text/javascript">$("#input-id2").click(function(event){Willow.callServer({"url":"/","data":"1"})});</script>'
]

{ #category : #'tests - Configuring - DOM' }
WebInteractionInterpreterTest >> testSetValueToThenTriggerChangeOf [

	| interpreter html id |

	interpreter := self clickInterpreter.
	id := '15'.


	html := self
		renderUsing: [ :canvas | 
			| textInput |

			textInput := canvas textInput
				id: id;
				yourself.
			interpreter setValueTo: [ 'Ok' ] thenTriggerChangeOf: textInput.
			interpreter applyTo: textInput on: canvas
			].

	self
		assert: html
		equals:
			'<input id="15" type="text"/><script type="text/javascript">$("#15").click(function(event){Willow.callServer({"url":"/","data":"1"})});</script>'
]

{ #category : #'tests - Configuring - DOM' }
WebInteractionInterpreterTest >> testSetValueToWithoutTriggeringChangeOf [

	| interpreter html id |

	interpreter := self clickInterpreter.
	id := '15'.


	html := self
		renderUsing: [ :canvas | 
			| textInput |

			textInput := canvas textInput
				id: id;
				yourself.
			interpreter setValueTo: [ 'Ok' ] withoutTriggeringChangeOf: textInput.
			interpreter applyTo: textInput on: canvas
			].

	self
		assert: html
		equals:
			'<input id="15" type="text"/><script type="text/javascript">$("#15").click(function(event){Willow.callServer({"url":"/","data":"1"})});</script>'
]

{ #category : #'tests - Configuring - DOM' }
WebInteractionInterpreterTest >> testShowLoadingNotificationDisplayingApplying [

	| interpreter html |

	interpreter := self changeInterpreter.

	interpreter
		showLoadingNotificationDisplaying: 'Loading...'
		applying: [ :view | view addClass willow ].
	html := self apply: interpreter toComponentDefinedBy: [ :canvas | canvas textInput ].

	self
		assert: html
		equals:
			'<input id="input-id2" type="text"/><script type="text/javascript">$("#input-id2").change(function(event){$("#willow-notification-section").html("<div class=\"willow\">Loading...</div>");Willow.callServer({"complete":function(){$("#willow-notification-section").html("")},"url":"/","data":"1"})});</script>'
]

{ #category : #'tests - Configuring - DOM' }
WebInteractionInterpreterTest >> testShowLoadingNotificationStyledAsAll [

	| interpreter html |

	interpreter := self changeInterpreter.

	interpreter showLoadingNotificationStyledAsAll: ( Array with: Classification >> #willow ).
	html := self apply: interpreter toComponentDefinedBy: [ :canvas | canvas textInput ].

	self
		assert: html
		equals:
			'<input id="input-id2" type="text"/><script type="text/javascript">$("#input-id2").change(function(event){$("#willow-notification-section").html("<div class=\"willow\">Loading...</div>");Willow.callServer({"complete":function(){$("#willow-notification-section").html("")},"url":"/","data":"1"})});</script>'
]

{ #category : #'tests - Configuring - DOM' }
WebInteractionInterpreterTest >> testShowWhileCallingServerToRender [

	| html link container |

	link := LinkWebView synchronicLabeled: 'Search!' applying: [  ].
	container := ContainerWebView
		wrapping: ''
		intoElementBuiltUsing: [ :canvas | canvas div ]
		applying: [  ].
	link on trigger show: 'Searching...' whileCallingServerToRender: container.

	html := self
		renderUsing: [ :canvas | 
			canvas
				render: link;
				render: container
			].

	self
		assert: html
		equals:
			'<a id="a-id3">Search!</a><div id="container-id1"></div><script type="text/javascript">$("#a-id3").click(function(event){$("#container-id1").html("Searching...");Willow.callServer({"url":"/","data":"2"})});</script>'
]

{ #category : #'tests - Configuring - Serialization' }
WebInteractionInterpreterTest >> testSubmitForm [

	| interpreter html id |

	interpreter := self clickInterpreter.
	id := '15'.

	html := self
		renderUsing: [ :canvas | 
			| form anchor |

			form := canvas form.
			form id: id.
			anchor := canvas anchor.
			anchor id: '16'.
			interpreter submitForm: form.
			interpreter applyTo: anchor on: canvas
			].

	self
		assert: html
		equals:
			'<form accept-charset="utf-8" method="post" action="/" id="15"></form><a id="16"></a><script type="text/javascript">$("#16").click(function(event){Willow.callServer({"url":"/","data":"1"})});</script>'
]

{ #category : #'tests - Configuring - Serialization' }
WebInteractionInterpreterTest >> testSubmitFormStyledAs [

	| interpreter html |

	interpreter := self clickInterpreter.

	html := self
		renderUsing: [ :canvas | 
			| anchor |

			canvas form apply: [ :form | form addClass willow ].
			anchor := canvas anchor.
			anchor id: '16'.
			interpreter submitFormStyledAs: Classification >> #willow.
			anchor interactUsing: interpreter
			].

	self
		assert: html
		equals:
			'<form accept-charset="utf-8" method="post" action="/" class="willow"></form><a id="16"></a><script type="text/javascript">$("#16").click(function(event){Willow.callServer({"url":"/","data":"1"})});</script>'
]

{ #category : #'tests - Configuring - DOM' }
WebInteractionInterpreterTest >> testTemporarilyDisableAndTransformInto [

	| interpreter html id |

	interpreter := self changeInterpreter.
	id := '15'.
	html := self
		renderUsing: [ :canvas | 
			| textInput |

			textInput := canvas textInput.
			textInput id: id.
			interpreter temporarilyDisableAndTransform: textInput into: 'Loading...'.
			interpreter applyTo: textInput on: canvas
			].

	self
		assert: html
		equals:
			'<input id="15" type="text"/><script type="text/javascript">$("#15").change(function(event){var componentToDisable=$("#15");if(componentToDisable.attr("data-willow-events-disabled")!=="disabled"){componentToDisable.attr("data-willow-events-disabled","disabled").addClass("willow-disabled-component").attr("data-original-html",componentToDisable.html()).attr("disabled",true).html("Loading...");Willow.callServer({"complete":function(){componentToDisable.removeAttr("data-willow-events-disabled").attr("disabled",false).removeClass("willow-disabled-component").html(componentToDisable.attr("data-original-html"))},"url":"/","data":"1"})}});</script>'
]

{ #category : #'tests - Configuring - DOM' }
WebInteractionInterpreterTest >> testTemporarilyDisableAndTransformSelfInto [

	| interpreter html id |

	interpreter := self changeInterpreter.
	id := '15'.
	html := self
		renderUsing: [ :canvas | 
			| textInput |

			textInput := canvas textInput.
			textInput id: id.
			interpreter temporarilyDisableAndTransformInto: 'Loading...'.
			interpreter applyTo: textInput on: canvas
			].

	self
		assert: html
		equals:
			'<input id="15" type="text"/><script type="text/javascript">$("#15").change(function(event){var componentToDisable=$(this);if(componentToDisable.attr("data-willow-events-disabled")!=="disabled"){componentToDisable.attr("data-willow-events-disabled","disabled").addClass("willow-disabled-component").attr("data-original-html",componentToDisable.html()).attr("disabled",true).html("Loading...");Willow.callServer({"complete":function(){componentToDisable.removeAttr("data-willow-events-disabled").attr("disabled",false).removeClass("willow-disabled-component").html(componentToDisable.attr("data-original-html"))},"url":"/","data":"1"})}});</script>'
]

{ #category : #'tests - Configuring - CSS' }
WebInteractionInterpreterTest >> testToggleCssClass [

	| interpreter html |

	interpreter := self clickInterpreter.
	interpreter
		updateCssClasses: [ :classes | classes toggleClass: Classification >> #loading ]
		onElementsMatching: [ :canvas | canvas jQuery this ].
	html := self
		apply: interpreter
		toComponentDefinedBy: [ :canvas | canvas textInput apply: [ :input | input addClass loading ] ].
	self
		assert: html
		equals:
			'<input class="willow-loading" id="input-id1" type="text"/><script type="text/javascript">$("#input-id1").click(function(event){$(this).toggleClass("willow-loading")});</script>'
]

{ #category : #'tests - Configuring - CSS' }
WebInteractionInterpreterTest >> testToggleCssClassOn [

	| interpreter element html |

	interpreter := self clickInterpreter.
	element := ContainerWebView
		wrapping: [  ]
		intoElementBuiltUsing: [ :canvas | canvas div ]
		applying: [  ].

	interpreter
		updateCssClasses: [ :classes | classes toggleClass: Classification >> #willow ]
		onElementsMatching: [ :canvas | canvas locate: element ].
	html := self configureTextInputWith: interpreter.
	self
		assert: html
		equals:
			'<input id="input-id2" type="text"/><script type="text/javascript">$("#input-id2").click(function(event){$("#container-id1").toggleClass("willow")});</script>'
]

{ #category : #'tests - Configuring - CSS' }
WebInteractionInterpreterTest >> testToggleCssClassOnComponentsMatching [

	| interpreter html |

	interpreter := self clickInterpreter.
	interpreter
		updateCssClasses: [ :classes | classes toggleClass: Classification >> #willow ]
		onElementsMatching: [ :canvas | canvas jQuery class: 'aComponentByStyleName' ].
	html := self configureTextInputWith: interpreter.
	self
		assert: html
		equals:
			'<input id="input-id1" type="text"/><script type="text/javascript">$("#input-id1").click(function(event){$(".aComponentByStyleName").toggleClass("willow")});</script>'
]

{ #category : #'tests - Configuring - DOM' }
WebInteractionInterpreterTest >> testTransformInto [

	| html link container |

	link := LinkWebView synchronicLabeled: 'Search!' applying: [  ].
	container := ContainerWebView
		wrapping: ''
		intoElementBuiltUsing: [ :canvas | canvas div ]
		applying: [  ].
	link on trigger transform: container into: 'Searching...'.

	html := self
		renderUsing: [ :canvas | 
			canvas
				render: link;
				render: container
			].

	self
		assert: html
		equals:
			'<a id="a-id2">Search!</a><div id="container-id1"></div><script type="text/javascript">$("#a-id2").click(function(event){$("#container-id1").html("Searching...")});</script>'
]

{ #category : #'tests - Configuring - CSS' }
WebInteractionInterpreterTest >> testUpdateCssClasses [

	| interpreter html |

	interpreter := self clickInterpreter.
	interpreter updateCssClasses: [ :classes | classes addClass: Classification >> #willow ].
	html := self configureTextInputWith: interpreter.
	self
		assert: html
		equals:
			'<input id="input-id1" type="text"/><script type="text/javascript">$("#input-id1").click(function(event){$(this).addClass("willow")});</script>'
]

{ #category : #'tests - Configuring - CSS' }
WebInteractionInterpreterTest >> testUpdateCssClassesOnElementsMatching [

	| interpreter html |

	interpreter := self clickInterpreter.
	interpreter
		updateCssClasses: [ :classes | classes addClass: Classification >> #willow ]
		onElementsMatching: [ :canvas | canvas jQuery class: 'aComponentByStyleName' ].
	html := self configureTextInputWith: interpreter.
	self
		assert: html
		equals:
			'<input id="input-id1" type="text"/><script type="text/javascript">$("#input-id1").click(function(event){$(".aComponentByStyleName").addClass("willow")});</script>'
]

{ #category : #'tests - Configuring' }
WebInteractionInterpreterTest >> testUserAgentDo [

	| interpreter html |

	interpreter := self clickInterpreter.
	interpreter userAgentDo: [ :canvas | ( JSStream on: 'window' ) call: 'print' ].
	html := self configureTextInputWith: interpreter.
	self
		assert: html
		equals:
			'<input id="input-id1" type="text"/><script type="text/javascript">$("#input-id1").click(function(event){window.print()});</script>'
]

{ #category : #'tests - Configuring' }
WebInteractionInterpreterTest >> testWithOnlyWhenServerDo [

	| interpreter html |

	interpreter := self clickInterpreter.
	interpreter
		with: ( JSStream on: 'dataFromUserAgent' )
		onlyWhen: [ :parameter | parameter greaterThan: 3 ]
		serverDo: [  ].
	html := self configureTextInputWith: interpreter.
	self
		assert: html
		equals:
			'<input id="input-id3" type="text"/><script type="text/javascript">$("#input-id3").click(function(event){if(dataFromUserAgent>3){Willow.callServer({"type":"POST","url":"/","data":["1","2="+encodeURIComponent(JSON.stringify(dataFromUserAgent))].join("&")})}});</script>'
]

{ #category : #'tests - Configuring' }
WebInteractionInterpreterTest >> testWithServerDo [

	| interpreter html |

	interpreter := self clickInterpreter.
	interpreter with: #(firstThing secondStuff) serverDo: [  ].
	html := self configureTextInputWith: interpreter.
	self
		assert: html
		equals:
			'<input id="input-id3" type="text"/><script type="text/javascript">$("#input-id3").click(function(event){Willow.callServer({"type":"POST","url":"/","data":["1","2="+encodeURIComponent(JSON.stringify(["firstThing","secondStuff"]))].join("&")})});</script>'
]

{ #category : #'tests - Instance Creation' }
WebInteractionInterpreterTest >> testWorkingWith [

	| interpreter html |

	interpreter := WebInteractionInterpreter
		workingWith:
			( WebComponentInteraction
				triggeredAccordingTo: ( InteractionScriptTrigger interactCalling: #dblclick )
				serializingWith: NullWebInteractionCommand new ).
	interpreter inform: 'A message'.
	html := self configureTextInputWith: interpreter.
	self
		assert: html
		equals:
			'<input id="input-id1" type="text"/><script type="text/javascript">$("#input-id1").dblclick(function(event){alert("A message")});</script>'
]
