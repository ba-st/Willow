tests
testApplyToOnWhenConditionsIsMet

	| html |

	html := self apply: (ConditionalComponentCommand applying: (ComponentAttributeCommand named: 'rows' with: 2) when: [ true ]) toComponentDefinedBy: [ :canvas | canvas div ].
	self assert: html equals: '<div rows="2"></div>'