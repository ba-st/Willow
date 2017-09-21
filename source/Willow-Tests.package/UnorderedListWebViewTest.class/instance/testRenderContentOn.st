tests-rendering
testRenderContentOn

	| list html |

	list := UnorderedListWebView applying: [  ] listing: #('spoon' 'fork') applyingToEach: [  ].

	html := self render: list.

	self assert: html equals: '<ul><li>spoon</li><li>fork</li></ul>'