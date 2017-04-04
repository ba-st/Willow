initialization
initialize

	super initialize.
	ajaxErrorHandlers := GRSmallDictionary new.
	reportingActionOptional := Optional unused.
	nonAjaxRenderBlockOptional := Optional unused.
	rootCommandOptional := Optional unused