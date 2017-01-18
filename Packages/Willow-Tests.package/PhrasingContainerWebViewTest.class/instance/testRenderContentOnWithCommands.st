tests-rendering
testRenderContentOnWithCommands

	| container html |

	container := PhrasingContainerWebView obtainingContentFrom: [ 'Hi!' ] applying: (ComponentClassificationCommand toStyleWith: 'teal').
	html := self render: container.

	self assert: html equals: '<span class="teal">Hi!</span>'