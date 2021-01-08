"
An AsynchronicButtonWebViewTest is a test class for testing the behavior of AsynchronicButtonWebView
"
Class {
	#name : #AsynchronicButtonWebViewTest,
	#superclass : #BWRenderingTest,
	#category : #'Willow-Core-Tests-WebViews'
}

{ #category : #'tests-rendering' }
AsynchronicButtonWebViewTest >> testIdentifyIn [

	| button html |

	button := AsynchronicButtonWebView labeled: 'Click me!'.

	html := self
		renderUsing: [ :canvas | 
			self assert: ( button identifierOn: canvas ) equals: 'button-id1'.
			canvas render: button
			].

	self assert: html equals: '<button id="button-id1" type="button">Click me!</button>'
]

{ #category : #'tests-rendering' }
AsynchronicButtonWebViewTest >> testOn [

	| button html |

	button := AsynchronicButtonWebView labeled: 'Click me!'.
	button on trigger disable.
	html := self render: button.
	self
		assert: html
		equals:
			'<button id="button-id1" type="button">Click me!</button><script type="text/javascript">$("#button-id1").click(function(event){$(this).prop("disabled",true)});</script>'
]

{ #category : #'tests-rendering' }
AsynchronicButtonWebViewTest >> testRenderContentOn [

	| button html |

	button := AsynchronicButtonWebView labeled: 'Click me!'.
	html := self render: button.
	self assert: html equals: '<button type="button">Click me!</button>'
]
