accessing
createHttpXmlRequestContext

	| request |

	request := WARequest new.
	request
		setHeaders:
			(Dictionary new
				at: 'x-requested-with' put: 'XMLHttpRequest';
				yourself).
	^ WARequestContext request: request response: WABufferedResponse new