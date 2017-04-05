actions
handleDefault: anException

	reportingAction value: self.
	self requestContext request isXmlHttpRequest
		ifTrue: [ self respondToXmlHttpRequestWith: anException messageText ]
		ifFalse: [ super handleDefault: anException ]