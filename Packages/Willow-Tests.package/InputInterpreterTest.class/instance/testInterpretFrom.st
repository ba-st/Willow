test
testInterpretFrom

	| interpreter |

	interpreter := InputInterpreter
		translatingFrom: [ :text | Array with: text size with: text size * 2 ]
		to: [ :model | model size asString ].
	self assert: (interpreter interpretFrom: 'this text') equals: #(9 18)