tests-processing
testAsEmail

	| html |

	html := self apply: InputModeCommand asEmail toComponentDefinedBy: [ :canvas | canvas textInput ].

	self assert: html equals: (self renderUsing: [:canvas | canvas emailInput ])