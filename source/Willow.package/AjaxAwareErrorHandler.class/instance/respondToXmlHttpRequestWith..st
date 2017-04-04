actions
respondToXmlHttpRequestWith: aMessageText

	self requestContext
		respond: [ :response | 
			response
				internalError;
				contentType:
					(WAMimeType textHtml
						charset: self requestContext charSet;
						yourself);
				nextPutAll: aMessageText ]