tests
testInputModeCommands

	| html |

	html := self apply: self commandBuilder dateInputMode toComponentDefinedBy: [ :canvas | canvas textInput ].

	self assert: html equals: (self renderUsing: [ :canvas | canvas dateInput5 ]).

	html := self apply: self commandBuilder numberInputMode toComponentDefinedBy: [ :canvas | canvas textInput ].

	self assert: html equals: (self renderUsing: [ :canvas | canvas numberInput ]).

	html := self apply: self commandBuilder passwordInputMode toComponentDefinedBy: [ :canvas | canvas textInput ].

	self assert: html equals: '<input type="password"/>'