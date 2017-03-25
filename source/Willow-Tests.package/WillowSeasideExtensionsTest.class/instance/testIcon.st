tests
testIcon

	| html |

	html := self render: [ :canvas | canvas icon ].

	self assert: html equals: '<i></i>'