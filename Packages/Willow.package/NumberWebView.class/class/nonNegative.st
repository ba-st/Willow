instance creation
nonNegative

	self deprecated: 'Use TextFieldWebView' transformWith: 'NumberWebView nonNegative' -> 'TextFieldWebView singleLineTriggeringOnChangeApplying: NumberInputModeCommand new + ComponentBoundaryCommand nonNegative'.
	^ TextFieldWebView singleLineTriggeringOnChangeApplying: NumberInputModeCommand new + ComponentBoundaryCommand nonNegative