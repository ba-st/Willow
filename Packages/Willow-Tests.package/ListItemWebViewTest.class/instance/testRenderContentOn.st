tests-rendering
testRenderContentOn

	| container html |

	container := ListItemWebView itemizing: 'Item' applying: CompositeComponentCommand empty.
	html := self render: container.

	self assert: html equals: '<li>Item</li>'