test support
configureScriptWith: interpreter

	| builder html |

	builder := WAHtmlCanvas builder
		fullDocument: false;
		codec: self codec.
	html := builder
		render: [ :canvas | 
			| script |

			script := canvas javascript.
			[ interpreter applyTo: script on: canvas ]
				on: WACurrentRequestContext
				do: [ :ex | ex resume: self ].

			canvas div script: script ].
	^ html