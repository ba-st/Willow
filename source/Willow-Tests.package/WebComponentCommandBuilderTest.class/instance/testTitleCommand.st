tests
testTitleCommand

	| html |

	html := self apply: (self commandBuilder setTitleTo: 'image') toComponentDefinedBy: [ :canvas | canvas image ].

	self assert: html equals: '<img alt="" title="image"/>'