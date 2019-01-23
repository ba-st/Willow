Extension { #name : #WARenderingTest }

{ #category : #'*Willow-SUnit' }
WARenderingTest >> apply: aWebInteractionObject toComponentDefinedBy: aComponentProvider [

	^ self
		apply: aWebInteractionObject
		toComponentDefinedBy: aComponentProvider
		afterApplyingDo: [ :canvas :component |  ]
]

{ #category : #'*Willow-SUnit' }
WARenderingTest >> apply: aWebInteractionObject toComponentDefinedBy: aComponentProvider afterApplyingDo: aPostAction [

	^ self
		renderUsing: [ :canvas |
			| component |

			component := aComponentProvider cull: canvas.
			aWebInteractionObject applyTo: component on: canvas.
			aPostAction value: canvas value: component ]
]

{ #category : #'*Willow-SUnit' }
WARenderingTest >> createHandlers [

	^ Array with: WARequestHandler new
]
