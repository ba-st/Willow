tests-rendering
testRenderContentOn

	| list html |

	list := UnorderedListWebView applying: [ :command |  ] listing: #('spoon' 'fork') applyingToEach: [ :command |  ].

	html := self render: list.

	self assert: html equals: '<ul><li>spoon</li><li>fork</li></ul>'