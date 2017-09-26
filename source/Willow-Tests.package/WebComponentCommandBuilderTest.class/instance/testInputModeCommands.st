tests
testInputModeCommands

	| html |

	html := self apply: self commandBuilder beDateInput toComponentDefinedBy: [ :canvas | canvas textInput ].

	self assert: html equals: (self renderUsing: [ :canvas | canvas dateInput5 ]).

	html := self apply: self commandBuilder beNumberInput toComponentDefinedBy: [ :canvas | canvas textInput ].

	self assert: html equals: (self renderUsing: [ :canvas | canvas numberInput ]).

	html := self apply: self commandBuilder bePasswordInput toComponentDefinedBy: [ :canvas | canvas textInput ].

	self assert: html equals: '<input type="password"/>'