test support
configureTextInputWith: interpreter

	| builder html |

	builder := WAHtmlCanvas builder
		fullDocument: false;
		codec: GRPharoUtf8Codec new.
	html := builder
		render: [ :canvas | 
			| input |

			input := canvas textInput.
			interpreter applyTo: input on: canvas ].
	^ html