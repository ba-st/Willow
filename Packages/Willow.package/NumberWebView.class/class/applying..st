instance creation
applying: aComponentCommand

	self
		deprecated: 'Use TextFieldWebView'
		transformWith: 'NumberWebView applying: ̀@aComponentCommand' -> 'TextFieldWebView singleLineTriggeringOnChangeApplying: NumberInputModeCommand new + ̀@aComponentCommand '.
	^ TextFieldWebView singleLineTriggeringOnChangeApplying: NumberInputModeCommand new + aComponentCommand