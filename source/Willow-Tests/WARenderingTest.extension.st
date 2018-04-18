Extension { #name : #WARenderingTest }

{ #category : #'*Willow-Tests' }
WARenderingTest >> apply: aWebInteractionObject toComponentDefinedBy: aComponentProvider [

	^ self
		apply: aWebInteractionObject
		toComponentDefinedBy: aComponentProvider
		afterApplyingDo: [ :canvas :component |  ]
]

{ #category : #'*Willow-Tests' }
WARenderingTest >> apply: aWebInteractionObject toComponentDefinedBy: aComponentProvider afterApplyingDo: aPostAction [

	^ self
		renderUsing: [ :canvas | 
			| component |

			component := aComponentProvider cull: canvas.
			aWebInteractionObject applyTo: component on: canvas.
			aPostAction value: canvas value: component ]
]

{ #category : #'*Willow-Tests' }
WARenderingTest >> useFileTestingPlatformDuring: aBlock [

	| installedPlatform |

	installedPlatform := GRPlatform current.
	[ GRPlatform current: (WAFileTestingPlatform wrapping: installedPlatform).
	aBlock value ]
		ensure: [ GRPlatform current: installedPlatform ]
]
