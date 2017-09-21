tests
testApplyToOnWhenConditionsIsNotMet

	| html |

	html := self apply: (ConditionalComponentCommand applying: (ComponentAttributeCommand named: 'rows' with: 2) when: [ false ]) toComponentDefinedBy: [ :canvas | canvas div ].
	self assert: html equals: '<div></div>'