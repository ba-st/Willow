tests
testRenderContentOn

	| container html |

	container := GenericContainerWebView obtainingContentFrom: ['Hi!'].
	html := self render: container.

	self assert: html equals: '<div>Hi!</div>'