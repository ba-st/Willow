tests-rendering
testIdentifyIn

	| unorderedList html |

	unorderedList := UnorderedListWebView
		applying: [ :list |  ]
		listing: #('spoon' 'fork')
		applyingToEach: [ :listItem |  ].

	html := self
		renderUsing: [ :canvas | 
			unorderedList identifyIn: canvas.
			canvas render: unorderedList ].

	self assert: html equals: '<ul id="unordered-list-id1"><li>spoon</li><li>fork</li></ul>'