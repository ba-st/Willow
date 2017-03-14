tests
testRenderContentOnWithCommands

	| container html |

	container :=
		GenericContainerWebView
			obtainingContentFrom: ['Hi!']
			applying: (ComponentClassificationCommand toStyleWith: 'teal').
	html := self render: container.

	self assert: html equals: '<div class="teal">Hi!</div>'