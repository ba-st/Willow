tests-processing
testAsNumeric

	| html |

	html := self apply: InputModeCommand asNumeric toComponentDefinedBy: [ :canvas | canvas textInput ].

	self assert: html equals: (self renderUsing: [:canvas | canvas numberInput ])