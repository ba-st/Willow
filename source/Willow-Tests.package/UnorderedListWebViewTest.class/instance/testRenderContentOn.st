tests-rendering
testRenderContentOn

	| list html |

	list := UnorderedListWebView
		applying: CompositeComponentCommand empty
		listing: #('spoon' 'fork')
		applyingToEach: CompositeComponentCommand empty.

	html := self render: list.

	self assert: html equals: '<ul><li>spoon</li><li>fork</li></ul>'