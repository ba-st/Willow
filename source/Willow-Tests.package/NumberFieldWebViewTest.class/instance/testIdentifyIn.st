tests-configuring
testIdentifyIn

	| field html |

	field := NumberFieldWebView applying: CompositeComponentCommand empty transformingWith: IntegerCodec new.

	html := self
		renderUsing: [ :canvas | 
			field identifyIn: canvas.
			canvas render: field ].

	self assert: html equals: '<input value="" name="2" id="text-id1" type="number"/>'