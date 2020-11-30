"
A CompositeComponentCommandTest is a test class for testing the behavior of CompositeComponentCommand
"
Class {
	#name : #CompositeComponentCommandTest,
	#superclass : #BWRenderingTest,
	#category : #'Willow-Tests-Frontend'
}

{ #category : #'tests-processing' }
CompositeComponentCommandTest >> testApplyToOn [

	| html |

	html := self
		apply:
			(CompositeComponentCommand
				applyingAll:
					(Array
						with: (ComponentAttributeCommand named: 'rows' with: 2)
						with: (ComponentAttributeCommand named: 'columns' with: 3)))
		toComponentDefinedBy: [ :canvas | canvas div ].
	self assert: html equals: '<div rows="2" columns="3"></div>'
]

{ #category : #'tests-processing' }
CompositeComponentCommandTest >> testEmpty [

	| html |

	html := self apply: CompositeComponentCommand empty toComponentDefinedBy: [ :canvas | canvas div ].
	self assert: html equals: '<div></div>'
]

{ #category : #'tests-processing' }
CompositeComponentCommandTest >> testShortcutCreation [

	| html |

	html := self
		apply: (ComponentAttributeCommand named: 'rows' with: 2) + (ComponentAttributeCommand named: 'columns' with: 3)
		toComponentDefinedBy: [ :canvas | canvas div ].
	self assert: html equals: '<div rows="2" columns="3"></div>'
]

{ #category : #'tests-processing' }
CompositeComponentCommandTest >> testShortcutCreationWithEmptyCompositeCommand [

	| command html |

	command := CompositeComponentCommand empty + (ComponentAttributeCommand named: 'columns' with: 3).
	html := self apply: command toComponentDefinedBy: [ :canvas | canvas div ].
	self assert: html equals: '<div columns="3"></div>'
]
