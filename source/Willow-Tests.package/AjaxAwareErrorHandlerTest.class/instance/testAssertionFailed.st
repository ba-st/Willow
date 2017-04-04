accessing
testAssertionFailed

	| context reportingActionWasEvaluated updateRootBlockWasEvaluated renderingBlockWasEvaluated |

	reportingActionWasEvaluated := false.
	updateRootBlockWasEvaluated := false.
	renderingBlockWasEvaluated := false.

	context := self createRequestContext.

	[ self handlerClass
		reportingAction: [ :handler | reportingActionWasEvaluated := true ];
		updateRootWith: [ :root | updateRootBlockWasEvaluated := true ];
		renderNonAjaxErrorsWith: [ :canvas :error | 
			self assert: (AssertionFailed handles: error).
			renderingBlockWasEvaluated := true ];
		handleExceptionsDuring: [ AssertionFailed signal ] context: context ]
		on: WAResponseNotification
		do: [ :n | 
			self
				assert: context response status equals: 500;
				assert: reportingActionWasEvaluated;
				assert: updateRootBlockWasEvaluated;
				assert: renderingBlockWasEvaluated.
			^ self ].

	self fail