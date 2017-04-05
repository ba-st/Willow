Error Handler - API
handles: anException

	^ (AjaxAwareErrorHandler handles: anException)
		or: [ ajaxErrorHandlers keys anySatisfy: [ :handler | handler handles: anException ] ]