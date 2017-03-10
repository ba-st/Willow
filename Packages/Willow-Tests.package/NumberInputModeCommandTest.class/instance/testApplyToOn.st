tests-processing
testApplyToOn

	| html |

	html := self apply: NumberInputModeCommand new toComponentDefinedBy: [ :canvas | canvas textInput ].

	self assert: html equals: (self renderUsing: [:canvas | canvas numberInput ])