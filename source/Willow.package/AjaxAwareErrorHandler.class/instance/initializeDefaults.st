initialization
initializeDefaults

	ajaxExceptionHandlers := GRSmallDictionary new.
	self
		reportingAction: [ :errorHandler |  ];
		updateRootWith: [ :root |  ];
		renderNonAjaxErrorsWith: [ :canvas :exception | super renderContentForException: exception on: canvas ]