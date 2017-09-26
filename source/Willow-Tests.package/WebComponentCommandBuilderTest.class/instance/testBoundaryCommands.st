tests
testBoundaryCommands

	| html |

	html := self apply: self commandBuilder boundNotNegative toComponentDefinedBy: [ :canvas | canvas numberInput ].

	self assert: html equals: '<input min="0" type="number"/>'.

	html := self
		apply: (self commandBuilder boundBetween: 15 and: 20)
		toComponentDefinedBy: [ :canvas | canvas numberInput ].

	self assert: html equals: '<input min="15" max="20" type="number"/>'