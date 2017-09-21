tests
testRenderContentOn

	| container html |

	container := FieldSetWebView
		containing: [ :canvas | canvas div ]
		applying: [ :command | command css willow ]
		withLegend: 'Fields'
		applying: [ :command | command css loading ].

	html := self render: container.

	self assert: html equals: '<fieldset class="willow"><legend class="willow-loading">Fields</legend><div></div></fieldset>'