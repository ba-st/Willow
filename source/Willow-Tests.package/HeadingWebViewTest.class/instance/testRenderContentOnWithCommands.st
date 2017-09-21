tests
testRenderContentOnWithCommands

	| container html |

	container := HeadingWebView displaying: 'Header' withLevel: 2 applying: [ :command | command css willow ].
	html := self render: container.

	self assert: html equals: '<h2 class="willow">Header</h2>'