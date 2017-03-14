test
testInputFor

	| interpreter |

	interpreter := InputInterpreter
		translatingFrom: [ :text | text size ]
		to: [ :model | model size asString ].
	self assert: (interpreter inputFor: #(6 8 15)) equals: '3'