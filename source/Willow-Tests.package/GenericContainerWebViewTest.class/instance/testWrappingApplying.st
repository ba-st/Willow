tests
testWrappingApplying

	| container html |

	container := GenericContainerWebView wrapping: 'Hello world' applying: [ :command |  ].
	html := self render: container.

	self assert: html equals: '<div>Hello world</div>'