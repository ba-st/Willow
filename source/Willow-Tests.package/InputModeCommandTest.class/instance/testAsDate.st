tests-processing
testAsDate

	| html |

	html := self apply: InputModeCommand asDate toComponentDefinedBy: [ :canvas | canvas textInput ].

	self assert: html equals: (self renderUsing: [:canvas | canvas dateInput5 ])