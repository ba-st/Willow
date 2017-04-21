tests
testIdentifyIn

	| field html |

	field := DateFieldWebView applying: CompositeComponentCommand empty.

	html := self
		renderUsing: [ :canvas | 
			field identifyIn: canvas.
			canvas render: field ].

	self assert: html equals: '<input value="" name="2" id="text-id1" type="date"/>'