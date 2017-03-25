tests-configuring
testIdentifyIn

	| field html |

	field := TextFieldWebView singleLineTriggeringOnChangeApplying: CompositeComponentCommand empty.
	html := self
		renderUsing: [ :canvas | 
			field identifyIn: canvas.
			canvas render: field ].

	self
		assert: html equals: '<input value="" name="2" id="text-id1" type="text"/>';
		assert: field identifier equals: 'text-id1'