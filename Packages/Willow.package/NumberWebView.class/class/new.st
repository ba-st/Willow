instance creation
new

	self deprecated: 'Use TextFieldWebView' transformWith: 'NumberWebView new' -> 'TextFieldWebView singleLineTriggeringOnChangeApplying: NumberInputModeCommand new'.
	^ TextFieldWebView singleLineTriggeringOnChangeApplying: NumberInputModeCommand new