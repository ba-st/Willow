tests-rendering
testRenderContentOn

	| container html |

	container := PhrasingContainerWebView obtainingContentFrom: [ 'Hi!' ].
	html := self render: container.

	self assert: html equals: '<span>Hi!</span>'