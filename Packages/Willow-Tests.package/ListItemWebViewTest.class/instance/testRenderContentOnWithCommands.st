tests-rendering
testRenderContentOnWithCommands

	| container html |

	container := ListItemWebView itemizing: 'Item' applying: (ComponentClassificationCommand toStyleWith: 'item').
	html := self render: container.

	self assert: html equals: '<li class="item">Item</li>'