accessing
testHandleErrorInAjaxCall

	| context |

	context := self createHttpXmlRequestContext.

	[ self handlerClass handleExceptionsDuring: [ Error signal ] context: context ]
		on: WAResponseNotification
		do: [ :n | 
			self assert: context response status equals: 500.
			^ self ].

	self fail