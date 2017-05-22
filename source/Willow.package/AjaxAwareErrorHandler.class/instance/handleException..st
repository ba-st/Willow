actions
handleException: anException

	self requestContext request isXmlHttpRequest
		ifTrue: [
			^ajaxExceptionHandlers keys
				detect: [:key | key handles: anException]
				ifFound: [:key | (ajaxExceptionHandlers at: key) cull: anException cull: self]
				ifNone: [super handleException: anException]].

	^super handleException: anException