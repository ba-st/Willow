tests
testTabIndexCommand

	| html |

	html := self apply: (self commandBuilder tabIndex: 3) toComponentDefinedBy: [ :canvas | canvas select ].

	self assert: html equals: '<select tabindex="3"></select>'