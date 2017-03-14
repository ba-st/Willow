tests-processing
testApplyToOn

	| html |

	html := self apply: (InputFieldMaxLengthCommand allowingUpTo: 25) toComponentDefinedBy: [ :canvas | canvas textInput ].
	self assert: html equals: '<input maxlength="25" type="text"/>'