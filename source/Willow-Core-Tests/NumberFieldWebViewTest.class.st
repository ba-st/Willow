"
A NumberFieldWebViewTest is a test class for testing the behavior of NumberFieldWebView
"
Class {
	#name : #NumberFieldWebViewTest,
	#superclass : #BWRenderingTest,
	#instVars : [
		'notificationWasReceived'
	],
	#category : #'Willow-Core-Tests-WebViews'
}

{ #category : #support }
NumberFieldWebViewTest >> changeNotifiedBy: aTextFieldWebView [ 
	
	notificationWasReceived := true
]

{ #category : #'tests-configuring' }
NumberFieldWebViewTest >> testIdentifyIn [

	| numberField html |

	numberField := NumberFieldWebView applying: [ :field |  ] transformingWith: IntegerCodec new.

	html := self
		renderUsing: [ :canvas | 
			numberField identifyIn: canvas.
			canvas render: numberField ].

	self assert: html equals: '<input value="" name="2" id="number-field-id1" type="number"/>'
]

{ #category : #'tests-number-container-API' }
NumberFieldWebViewTest >> testNotifyChangesTo [

	| numberField |

	numberField := NumberFieldWebView applying: [ :field |  ] transformingWith: IntegerCodec new.

	numberField notifyChangesTo: self.
	notificationWasReceived := false.
	numberField changeNumberTo: -5.
	self assert: notificationWasReceived
]

{ #category : #'tests-number-container-API' }
NumberFieldWebViewTest >> testNumber [

	| numberField html |

	numberField := NumberFieldWebView applying: [ :field |  ] transformingWith: IntegerCodec new.

	self assert: numberField number equals: 0.

	numberField changeNumberTo: 15.

	self assert: numberField number equals: 15.
	html := self render: numberField.

	self assert: html equals: '<input value="15" name="1" type="number"/>'
]

{ #category : #'tests-configuring' }
NumberFieldWebViewTest >> testOn [

	| numberField html |

	numberField := NumberFieldWebView applying: [ :field |  ] transformingWith: IntegerCodec new.

	numberField on trigger disable.
	html := self render: numberField.

	self
		assert: html
		equals:
			'<input value="" name="1" type="number" id="input-id2"/><script type="text/javascript">$("#input-id2").change(function(event){$(this).prop("disabled",true)});</script>'
]

{ #category : #'tests-rendering' }
NumberFieldWebViewTest >> testRenderContentOn [

	| numberField html |

	numberField := NumberFieldWebView applying: [ :field |  ] transformingWith: IntegerCodec new.

	html := self render: numberField.

	self assert: html equals: '<input value="" name="1" type="number"/>'
]
