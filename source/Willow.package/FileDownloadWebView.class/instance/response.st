accessing - private
response

	^
	[:response |
	| document |
	document := self document.
	response
		contentType: document contentType;
		attachmentWithFileName: document fileName;
		nextPutAll: document content]