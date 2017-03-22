tests-processing
testApplyToOn

	| html |

	html := self apply: (ComponentBoundaryCommand between: 15 and: 20) toComponentDefinedBy: [ :canvas | canvas numberInput ].
	self assert: html equals: '<input min="15" max="20" type="number"/>'