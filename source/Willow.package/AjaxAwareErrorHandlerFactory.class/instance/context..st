Error Handler - API
context: aRequestContext

	| handler |

	handler := AjaxAwareErrorHandler context: aRequestContext.
	reportingActionOptional withContentDo: [ :reportingAction | handler reportingAction: reportingAction ].
	rootCommandOptional withContentDo: [ :rootCommand | handler updateRootWith: rootCommand ].
	nonAjaxRenderBlockOptional withContentDo: [ :nonAjaxRenderBlock | handler renderNonAjaxErrorsWith: nonAjaxRenderBlock ].
	ajaxErrorHandlers
		keysAndValuesDo: [ :exceptionSelector :action | 
			handler
				on: exceptionSelector
				do: action ].
	^ handler