tests-processing
testNonNegative

	| html |

	html := self apply: ComponentBoundaryCommand nonNegative toComponentDefinedBy: [ :canvas | canvas numberInput ].
	self assert: html equals: '<input min="0" type="number"/>'