accessing
testReportingActionArgumentsAreOptional

	| context reportingActionWasEvaluated |

	reportingActionWasEvaluated := false.

	context := self createRequestContext.

	[ self handlerClass
		reportingAction: [ reportingActionWasEvaluated := true ];
		updateRootWith: [ :root |  ];
		renderNonAjaxErrorsWith: [ :canvas :error |  ];
		handleExceptionsDuring: [ AssertionFailed signal ] context: context ]
		on: WAResponseNotification
		do: [ :n | 
			self
				assert: context response status equals: 500;
				assert: reportingActionWasEvaluated.
			^ self ].

	self fail