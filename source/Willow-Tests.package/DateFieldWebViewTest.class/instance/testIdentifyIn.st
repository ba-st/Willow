tests
testIdentifyIn

	| dateField html |

	dateField := DateFieldWebView applying: [ :field |  ].

	html := self
		renderUsing: [ :canvas | 
			dateField identifyIn: canvas.
			canvas render: dateField ].

	self assert: html equals: '<input value="" name="2" id="text-id1" type="date"/>'