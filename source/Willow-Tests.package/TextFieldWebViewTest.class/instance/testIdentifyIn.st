tests-configuring
testIdentifyIn

	| textField html |

	textField := TextFieldWebView singleLineTriggeringOnChangeApplying: [ :field |  ].
	html := self
		renderUsing: [ :canvas | 
			textField identifyIn: canvas.
			canvas render: textField ].

	self
		assert: html equals: '<input value="" name="2" id="text-id1" type="text"/>';
		assert: textField identifier equals: 'text-id1'