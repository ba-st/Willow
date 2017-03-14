tests
testRenderContentOn

	| container html |

	container := FieldSetWebView
		containing: [ :canvas | canvas div ]
		applying: (ComponentClassificationCommand toStyleWith: 'strong')
		withLegend: 'Fields'
		applying: (ComponentClassificationCommand toStyleWith: 'cursive').

	html := self render: container.

	self assert: html equals: '<fieldset class="strong"><legend class="cursive">Fields</legend><div></div></fieldset>'