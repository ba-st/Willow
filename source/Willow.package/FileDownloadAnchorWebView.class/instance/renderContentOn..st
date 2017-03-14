rendering
renderContentOn: aCanvas

	| anchor |

	anchor := aCanvas anchor.
	anchor
		callback: [ aCanvas requestContext
				respond: [ :response | 
					| document |
					document := documentProvider value.
					response
						contentType: document contentType;
						attachmentWithFileName: document fileName;
						nextPutAll: document content ] ].
	commandToComponent applyTo: anchor on: aCanvas.
	anchor with: label