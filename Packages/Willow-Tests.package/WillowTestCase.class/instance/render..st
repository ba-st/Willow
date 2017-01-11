utility
render: aWebView

	| builder html |

	builder := WAHtmlCanvas builder
		fullDocument: false;
		codec: self codec.
	html := builder
		render: [ :canvas | 
			[ canvas render: aWebView ]
				on: WACurrentRequestContext
				do: [ :ex | ex resume: self ] ].
	^ html