tests-rendering
testRenderContentOnWithCommands

	| unorderedList html |

	unorderedList := UnorderedListWebView applying: [ :list | list addClass willow ] listing: #('spoon' 'fork') applyingToEach: [ :listItem | listItem addClass loading ].

	html := self render: unorderedList.

	self assert: html equals: '<ul class="willow"><li class="willow-loading">spoon</li><li class="willow-loading">fork</li></ul>'