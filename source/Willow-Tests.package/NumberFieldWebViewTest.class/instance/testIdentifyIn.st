tests-configuring
testIdentifyIn

	| numberField html |

	numberField := NumberFieldWebView applying: [ :field |  ] transformingWith: IntegerCodec new.

	html := self
		renderUsing: [ :canvas | 
			numberField identifyIn: canvas.
			canvas render: numberField ].

	self assert: html equals: '<input value="" name="2" id="text-id1" type="number"/>'