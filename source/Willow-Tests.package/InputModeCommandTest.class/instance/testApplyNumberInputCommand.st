tests-processing
testApplyNumberInputCommand

	| html |

	html := self apply: InputModeCommand asNumber toComponentDefinedBy: [ :canvas | canvas textInput ].

	self assert: html equals: (self renderUsing: [ :canvas | canvas numberInput ])