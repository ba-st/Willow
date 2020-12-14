"
An AjaxAwareErrorHandlerTest is a test class for testing the behavior of AjaxAwareErrorHandler
"
Class {
	#name : #AjaxAwareErrorHandlerTest,
	#superclass : #WAErrorHandlerTest,
	#category : #'Willow-Core-Tests-Applications'
}

{ #category : #accessing }
AjaxAwareErrorHandlerTest >> createHttpXmlRequestContext [

	| request |

	request := WARequest new.
	request
		setHeaders:
			(GRSmallDictionary new
				at: 'x-requested-with' put: 'XMLHttpRequest';
				yourself).
	^ WARequestContext request: request response: WABufferedResponse new
]

{ #category : #accessing }
AjaxAwareErrorHandlerTest >> handlerClass [

	^ AjaxAwareErrorHandlerFactory new
		on: AssertionFailed
			do: [ :assertionFailed | assertionFailed return ];
		yourself
]

{ #category : #accessing }
AjaxAwareErrorHandlerTest >> testAssertionFailed [

	| context reportingActionWasEvaluated updateRootBlockWasEvaluated renderingBlockWasEvaluated |

	reportingActionWasEvaluated := false.
	updateRootBlockWasEvaluated := false.
	renderingBlockWasEvaluated := false.

	context := self createRequestContext.

	[ self handlerClass
		reportingAction: [ :handler :exception | reportingActionWasEvaluated := exception isA: AssertionFailed ];
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
]

{ #category : #accessing }
AjaxAwareErrorHandlerTest >> testHandleErrorInAjaxCall [

	| context |

	context := self createHttpXmlRequestContext.

	[ self handlerClass handleExceptionsDuring: [ Error signal ] context: context ]
		on: WAResponseNotification
		do: [ :n | 
			self assert: context response status equals: 500.
			^ self ].

	self fail
]

{ #category : #accessing }
AjaxAwareErrorHandlerTest >> testHandlerErrorInAjaxCallReferencingHandler [

	| context ajaxHandlerWasEvaluated |

	ajaxHandlerWasEvaluated := false.

	context := self createHttpXmlRequestContext.

	AjaxAwareErrorHandlerFactory new
		on: AssertionFailed
			do: [ :error :handler | ajaxHandlerWasEvaluated := (error isAn: AssertionFailed) and: [ handler isAn: AjaxAwareErrorHandler ] ];
		handleExceptionsDuring: [ AssertionFailed signal ] context: context.

	self assert: ajaxHandlerWasEvaluated
]

{ #category : #accessing }
AjaxAwareErrorHandlerTest >> testReportingActionArgumentsAreOptional [

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
]

{ #category : #accessing }
AjaxAwareErrorHandlerTest >> testXmlHttpRequest [

	| context |

	context := self createHttpXmlRequestContext.
	"AssertionFailed is in the list of handled exceptions configured"
	[ self handlerClass
		renderNonAjaxErrorsWith: [ :canvas :error | self fail ];
		handleExceptionsDuring: [ AssertionFailed signal ] context: context ]
		on: WAResponseNotification
		do: [ :n | self fail ]
]

{ #category : #accessing }
AjaxAwareErrorHandlerTest >> testXmlHttpRequestWithResumable [

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
]
