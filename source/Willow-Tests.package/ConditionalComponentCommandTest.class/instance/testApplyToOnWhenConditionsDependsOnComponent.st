tests
testApplyToOnWhenConditionsDependsOnComponent

	| html |

	html := self apply: (ConditionalComponentCommand applying: (ComponentAttributeCommand named: 'rows' with: 2) when: [ :div | div id notNil ]) toComponentDefinedBy: [ :canvas | canvas div ].
	self assert: html equals: '<div></div>'.

	html := self apply: (ConditionalComponentCommand applying: (ComponentAttributeCommand named: 'rows' with: 2) when: [ :div | div id isNil ]) toComponentDefinedBy: [ :canvas | canvas div ].
	self assert: html equals: '<div rows="2"></div>'