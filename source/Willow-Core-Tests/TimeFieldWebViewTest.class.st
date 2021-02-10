"
A TimeFieldWebViewTest is a test class for testing the behavior of TimeFieldWebView
"
Class {
	#name : #TimeFieldWebViewTest,
	#superclass : #BWRenderingTest,
	#instVars : [
		'notificationWasReceived'
	],
	#category : #'Willow-Core-Tests-WebViews'
}

{ #category : #support }
TimeFieldWebViewTest >> changeNotifiedBy: aTextFieldWebView [ 
	
	notificationWasReceived := true
]

{ #category : #tests }
TimeFieldWebViewTest >> testBeIdentifiable [

	| timeField html |

	timeField := TimeFieldWebView applying: [ :field |  ].

	timeField beIdentifiable.
	html := self render: timeField.

	self assert: html equals: '<input value="" name="1" id="time-field-id2" type="time"/>'
]

{ #category : #tests }
TimeFieldWebViewTest >> testIdentifierOn [

	| timeField html |

	timeField := TimeFieldWebView applying: [ :field |  ].

	html := self
		renderUsing: [ :canvas | 
			timeField identifierOn: canvas.
			canvas render: timeField
			].

	self assert: html equals: '<input value="" name="2" id="time-field-id1" type="time"/>'
]

{ #category : #tests }
TimeFieldWebViewTest >> testNotifyChangesTo [

	| timeField |

	timeField := TimeFieldWebView applying: [ :field |  ].

	timeField notifyChangesTo: self.
	notificationWasReceived := false.
	timeField changeTimeTo: Time now.
	self assert: notificationWasReceived
]

{ #category : #tests }
TimeFieldWebViewTest >> testOn [

	| timeField html |

	timeField := TimeFieldWebView applying: [ :field |  ].

	timeField on trigger disable.
	html := self render: timeField.

	self
		assert: html
		equals:
			'<input value="" name="1" type="time" id="input-id2"/><script type="text/javascript">$("#input-id2").change(function(event){$(this).prop("disabled",true)});</script>'
]

{ #category : #tests }
TimeFieldWebViewTest >> testRenderContentOn [

	| timeField html |

	timeField := TimeFieldWebView applying: [ :field |  ].

	html := self render: timeField.

	self assert: html equals: '<input value="" name="1" type="time"/>'
]

{ #category : #tests }
TimeFieldWebViewTest >> testTime [

	| timeField html currentTime |

	timeField := TimeFieldWebView applying: [ :field |  ].

	self should: [ timeField time ] raise: InstanceCreationFailed.

	currentTime := Time hour: 11 minute: 28 second: 55.
	timeField changeTimeTo: currentTime.

	self assert: timeField time equals: currentTime.
	html := self render: timeField.

	self assert: html equals: '<input value="11:28:55" name="1" type="time"/>'
]
