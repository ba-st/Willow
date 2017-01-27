tests
testRenderContentOn

	| container html |

	container := HeadingWebView displaying: 'Header' withLevel: 2.
	html := self render: container.

	self assert: html equals: '<h2>Header</h2>'