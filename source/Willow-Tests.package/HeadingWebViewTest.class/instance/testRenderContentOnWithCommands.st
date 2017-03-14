tests
testRenderContentOnWithCommands

	| container html |

	container :=
		HeadingWebView
			displaying: 'Header'
			withLevel: 2
			applying: (ComponentClassificationCommand toStyleWith: 'teal').
	html := self render: container.

	self assert: html equals: '<h2 class="teal">Header</h2>'