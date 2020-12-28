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
			synchronicButton identifyIn: canvas.
			canvas render: synchronicButton ].

	self
		assert: html
			equals: '<button id="submit-button-id1" name="2" type="submit">Click me!</button>';
		assert: synchronicButton identifier equals: 'submit-button-id1'
]

{ #category : #'tests-rendering' }
SynchronicSubmitButtonWebViewTest >> testOnTrigger [

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
