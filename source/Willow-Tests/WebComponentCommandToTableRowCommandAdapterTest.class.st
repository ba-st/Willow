"
A WebComponentCommandToTableRowCommandAdapterTest is a test class for testing the behavior of WebComponentCommandToTableRowCommandAdapter
"
Class {
	#name : #WebComponentCommandToTableRowCommandAdapterTest,
	#superclass : #WARenderingTest,
	#category : 'Willow-Tests-Frontend'
}

{ #category : #'tests-Applying' }
WebComponentCommandToTableRowCommandAdapterTest >> testApplyToForOn [

	| html command |

	command := (ComponentClassificationCommand toStyleWith: Willow classes >> #fadingNotification) asTableRowCommand.
	html := self
		renderUsing: [ :canvas | 
			| component |

			component := canvas tableRow.
			command applyTo: component for: 33 on: canvas ].

	self
		assert: html
		equals:
			(String
				streamContents: [ :stream | 
					stream
						nextPutAll: '<tr class="';
						nextPutAll: Willow classes >> #fadingNotification;
						nextPutAll: '"></tr>' ])
]
