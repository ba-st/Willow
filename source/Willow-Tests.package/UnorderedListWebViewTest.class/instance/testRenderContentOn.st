tests-rendering
testRenderContentOn

	| unorderedList html |

	unorderedList := UnorderedListWebView applying: [ :list |  ] listing: #('spoon' 'fork') applyingToEach: [ :listItem |  ].

	html := self render: unorderedList.

	self assert: html equals: '<ul><li>spoon</li><li>fork</li></ul>'