tests
testRenderContentOnWithCommands

	| container html |

	container := GenericContainerWebView obtainingContentFrom: [ 'Hi!' ] applying: [ :command | command css willow ].
	html := self render: container.

	self assert: html equals: '<div class="willow">Hi!</div>'