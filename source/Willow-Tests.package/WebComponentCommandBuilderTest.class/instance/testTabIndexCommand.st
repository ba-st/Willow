tests
testTabIndexCommand

	| html |

	html := self apply: (self commandBuilder setTabIndexTo: 3) toComponentDefinedBy: [ :canvas | canvas select ].

	self assert: html equals: '<select tabindex="3"></select>'