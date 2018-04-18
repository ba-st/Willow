Class {
	#name : #WebComponentInteractionTest,
	#superclass : #WARenderingTest,
	#category : 'Willow-Tests-WebInteraction'
}

{ #category : #tests }
WebComponentInteractionTest >> testNeverTriggered [

	| interaction html |

	interaction := WebComponentInteraction neverTriggered.
	html := self
		renderUsing: [ :canvas | 
			| component |

			component := canvas textInput.
			interaction applyTo: component on: canvas ].
	self assert: html equals: '<input type="text"/>'
]
