accessing
handlerClass

	^ AjaxAwareErrorHandlerFactory new
		on: AssertionFailed
			do: [ :assertionFailed | assertionFailed return ];
		yourself