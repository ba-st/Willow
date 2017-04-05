actions
handleException: anException

	self requestContext request isXmlHttpRequest
		ifTrue: [
			^ajaxExceptionHandlers keys
				detect: [:key | key handles: anException]
				ifFound: [:key | (ajaxExceptionHandlers at: key) value: anException]
				ifNone: [super handleException: anException]].

	^super handleException: anException