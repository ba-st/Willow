private - utility
javascriptContentFrom: aMonadycBlock

	WACurrentRequestContext
		use: (WARequestContext request: WARequest new response: WABufferedResponse new)
		during: [ WAHtmlCanvas builder
				fullDocument: false;
				render: [ :canvas | 
					| javascript |
					javascript := canvas javascript.
					aMonadycBlock cull: javascript.
					^ javascript greaseString ] ]