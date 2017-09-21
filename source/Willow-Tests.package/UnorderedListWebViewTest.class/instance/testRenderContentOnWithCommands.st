tests-rendering
testRenderContentOnWithCommands

	| list html |

	list := UnorderedListWebView applying: [ :command | command css willow ] listing: #('spoon' 'fork') applyingToEach: [ :command | command css loading ].

	html := self render: list.

	self assert: html equals: '<ul class="willow"><li class="willow-loading">spoon</li><li class="willow-loading">fork</li></ul>'