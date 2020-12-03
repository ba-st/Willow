"
A ConditionalComponentCommandTest is a test class for testing the behavior of ConditionalComponentCommand
"
Class {
	#name : #ConditionalComponentCommandTest,
	#superclass : #BWRenderingTest,
	#category : #'Willow-Core-Tests-Frontend'
}

{ #category : #tests }
ConditionalComponentCommandTest >> testApplyToOnWhenConditionsDependsOnComponent [

	| html |

	html := self apply: (ConditionalComponentCommand applying: (ComponentAttributeCommand named: 'rows' with: 2) when: [ :div | div id notNil ]) toComponentDefinedBy: [ :canvas | canvas div ].
	self assert: html equals: '<div></div>'.

	html := self apply: (ConditionalComponentCommand applying: (ComponentAttributeCommand named: 'rows' with: 2) when: [ :div | div id isNil ]) toComponentDefinedBy: [ :canvas | canvas div ].
	self assert: html equals: '<div rows="2"></div>'
]

{ #category : #tests }
ConditionalComponentCommandTest >> testApplyToOnWhenConditionsIsMet [

	| html |

	html := self apply: (ConditionalComponentCommand applying: (ComponentAttributeCommand named: 'rows' with: 2) when: [ true ]) toComponentDefinedBy: [ :canvas | canvas div ].
	self assert: html equals: '<div rows="2"></div>'
]

{ #category : #tests }
ConditionalComponentCommandTest >> testApplyToOnWhenConditionsIsNotMet [

	| html |

	html := self apply: (ConditionalComponentCommand applying: (ComponentAttributeCommand named: 'rows' with: 2) when: [ false ]) toComponentDefinedBy: [ :canvas | canvas div ].
	self assert: html equals: '<div></div>'
]
