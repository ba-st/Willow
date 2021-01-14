"
A SynchronicSubmitButtonWebViewTest is a test class for testing the behavior of SynchronicSubmitButtonWebView
"
Class {
	#name : #SynchronicSubmitButtonWebViewTest,
	#superclass : #BWRenderingTest,
	#category : #'Willow-Core-Tests-WebViews'
}

{ #category : #tests }
SynchronicSubmitButtonWebViewTest >> testIdentifyIn [

	| synchronicButton html |

	synchronicButton := SynchronicSubmitButtonWebView
		labeled: 'Click me!'
		applying: [ :button |  ]
		evaluating: [  ].

	html := self
		renderUsing: [ :canvas | 
			self assert: ( synchronicButton identifierOn: canvas ) equals: 'submit-button-id1'.
			canvas render: synchronicButton
			].

	self
		assert: html
		equals: '<button name="2" id="submit-button-id1" type="submit">Click me!</button>'
]

{ #category : #'tests-rendering' }
SynchronicSubmitButtonWebViewTest >> testOn [

	| synchronicButton html |

	synchronicButton := SynchronicSubmitButtonWebView
		labeled: 'Submit'
		applying: [ :button |  ]
		evaluating: [  ].
	synchronicButton on trigger disable.
	html := self render: synchronicButton.

	self
		assert: html
		equals:
			'<button name="1" id="button-id2" type="submit">Submit</button><script type="text/javascript">$("#button-id2").click(function(event){$(this).prop("disabled",true)});</script>'
]

{ #category : #'tests-rendering' }
SynchronicSubmitButtonWebViewTest >> testRenderContentOn [

	| synchronicButton html |

	synchronicButton := SynchronicSubmitButtonWebView
		labeled: 'Submit'
		applying: [ :button |  ]
		evaluating: [  ].
	html := self render: synchronicButton.

	self assert: html equals: '<button name="1" type="submit">Submit</button>'
]
