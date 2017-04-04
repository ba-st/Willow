accessing
testXmlHttpRequestWithResumable

	| context handlerWasEvaluated |

	handlerWasEvaluated := false.

	context := self createHttpXmlRequestContext.
	[ self handlerClass
		on: ZeroDivide
			do: [ :error | 
				handlerWasEvaluated := true.
				error resume ];
		renderNonAjaxErrorsWith: [ :canvas :error | self fail ];
		handleExceptionsDuring: [ ZeroDivide signal ] context: context ]
		on: WAResponseNotification
		do: [ :n | self fail ].

	self assert: handlerWasEvaluated