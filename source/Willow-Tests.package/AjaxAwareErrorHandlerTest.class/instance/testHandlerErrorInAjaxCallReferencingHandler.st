accessing
testHandlerErrorInAjaxCallReferencingHandler

	| context ajaxHandlerWasEvaluated |

	ajaxHandlerWasEvaluated := false.

	context := self createHttpXmlRequestContext.

	AjaxAwareErrorHandlerFactory new
		on: AssertionFailed
			do: [ :error :handler | ajaxHandlerWasEvaluated := (error isAn: AssertionFailed) and: [ handler isAn: AjaxAwareErrorHandler ] ];
		handleExceptionsDuring: [ AssertionFailed signal ] context: context.

	self assert: ajaxHandlerWasEvaluated