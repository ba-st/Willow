private
willowDefaults

	^ GRSmallDictionary new
		at: 'version' put: self version;
		at: WillowConstants handleAjaxErrorCallFunctionName
			put: self defaultHandleAjaxErrorCallFunction;
		at: WillowConstants callServerFunctionName put: self callServerFunction;
		yourself