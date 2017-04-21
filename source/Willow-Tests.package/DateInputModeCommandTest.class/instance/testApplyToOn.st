tests-processing
testApplyToOn

	| html |

	html := self apply: DateInputModeCommand new toComponentDefinedBy: [ :canvas | canvas textInput ].

	self assert: html equals: (self renderUsing: [ :canvas | canvas dateInput5 ])