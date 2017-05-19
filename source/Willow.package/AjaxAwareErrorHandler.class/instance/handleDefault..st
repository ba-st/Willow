actions
handleDefault: anException

	self valueReportingActionWhenHandling: anException.
	self requestContext request isXmlHttpRequest
		ifTrue: [ self respondToXmlHttpRequestWith: anException messageText ]
		ifFalse: [ super handleDefault: anException ]