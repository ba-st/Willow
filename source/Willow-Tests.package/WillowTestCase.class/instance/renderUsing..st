utility
renderUsing: aMonadycBlock

	| builder html |

	builder := WAHtmlCanvas builder
		fullDocument: false;
		codec: self codec.
	html := WACurrentRequestContext
		use: self
		during: [ builder render: [ :canvas | aMonadycBlock cull: canvas ] ].
	^ html