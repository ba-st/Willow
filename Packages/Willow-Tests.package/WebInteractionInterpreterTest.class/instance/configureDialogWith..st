test support
configureDialogWith: interpreter

	| builder html |

	builder := WAHtmlCanvas builder
		fullDocument: false;
		codec: self codec.
	html := builder
		render: [ :canvas | 
			| dialog |

			dialog := canvas jQuery new dialog.
			[ interpreter applyTo: dialog on: canvas ]
				on: WACurrentRequestContext
				do: [ :ex | ex resume: self ].

			canvas div script: dialog ].
	^ html