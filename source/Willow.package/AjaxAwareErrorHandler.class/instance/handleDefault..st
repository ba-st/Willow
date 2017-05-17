actions
handleDefault: anException

	self valueReportingAction.
	self requestContext request isXmlHttpRequest
		ifTrue: [ self respondToXmlHttpRequestWith: anException messageText ]
		ifFalse: [ super handleDefault: anException ]