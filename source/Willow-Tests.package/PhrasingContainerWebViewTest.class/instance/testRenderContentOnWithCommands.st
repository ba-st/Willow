tests-rendering
testRenderContentOnWithCommands

	| container html |

	container := PhrasingContainerWebView obtainingContentFrom: [ 'Hi!' ] applying: [ :command | command css willow ].
	html := self render: container.

	self assert: html equals: '<span class="willow">Hi!</span>'