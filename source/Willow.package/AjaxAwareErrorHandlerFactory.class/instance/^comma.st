Error Handler - API
, anException

	^ ajaxErrorHandlers keys
		inject: AjaxAwareErrorHandler , anException
		into: [ :exceptionSet :currentExceptionSelector | exceptionSet , currentExceptionSelector ]