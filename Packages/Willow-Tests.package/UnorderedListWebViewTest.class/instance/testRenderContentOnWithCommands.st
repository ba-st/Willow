tests-rendering
testRenderContentOnWithCommands

	| list html |

	list := UnorderedListWebView
		applying: (ComponentClassificationCommand toStyleWith: 'shopping-list')
		listing: #('spoon' 'fork')
		applyingToEach: (ComponentClassificationCommand toStyleWith: 'shopping-item').

	html := self render: list.

	self assert: html equals: '<ul class="shopping-list"><li class="shopping-item">spoon</li><li class="shopping-item">fork</li></ul>'