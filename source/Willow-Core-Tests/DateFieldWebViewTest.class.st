"
A DateFieldWebViewTest is a test class for testing the behavior of DateFieldWebView
"
Class {
	#name : #DateFieldWebViewTest,
	#superclass : #BWRenderingTest,
	#instVars : [
		'notificationWasReceived'
	],
	#category : #'Willow-Core-Tests-WebViews'
}

{ #category : #support }
DateFieldWebViewTest >> changeNotifiedBy: aTextFieldWebView [ 
	
	notificationWasReceived := true
]

{ #category : #tests }
DateFieldWebViewTest >> testBeIdentifiable [

	| dateField html |

	dateField := DateFieldWebView applying: [ :field |  ].

	dateField beIdentifiable.
	html := self render: dateField.

	self assert: html equals: '<input value="" name="1" id="date-field-id2" type="date"/>'
]

{ #category : #tests }
DateFieldWebViewTest >> testDate [

	| dateField html currentDate |

	dateField := DateFieldWebView applying: [ :field |  ].

	self should: [ dateField date ] raise: InstanceCreationFailed.

	currentDate := Date newDay: 1 month: 1 year: 2001.
	dateField changeDateTo: currentDate.

	self assert: dateField date equals: currentDate.
	html := self render: dateField.

	self assert: html equals: '<input value="2001-01-01" name="1" type="date"/>'
]

{ #category : #tests }
DateFieldWebViewTest >> testIdentifierOn [

	| dateField html |

	dateField := DateFieldWebView applying: [ :field |  ].

	html := self
		renderUsing: [ :canvas | 
			dateField identifierOn: canvas.
			canvas render: dateField ].

	self assert: html equals: '<input value="" name="2" id="date-field-id1" type="date"/>'
]

{ #category : #tests }
DateFieldWebViewTest >> testNotifyChangesTo [

	| dateField |

	dateField := DateFieldWebView applying: [ :field |  ].

	dateField notifyChangesTo: self.
	notificationWasReceived := false.
	dateField changeDateTo: Date today.
	self assert: notificationWasReceived
]

{ #category : #tests }
DateFieldWebViewTest >> testOn [

	| dateField html |

	dateField := DateFieldWebView applying: [ :field |  ].

	dateField on trigger disable.
	html := self render: dateField.

	self
		assert: html
		equals:
			'<input value="" name="1" type="date" id="input-id2"/><script type="text/javascript">$("#input-id2").change(function(event){$(this).prop("disabled",true)});</script>'
]

{ #category : #tests }
DateFieldWebViewTest >> testRenderContentOn [

	| dateField html |

	dateField := DateFieldWebView applying: [ :field |  ].

	html := self render: dateField.

	self assert: html equals: '<input value="" name="1" type="date"/>'
]
