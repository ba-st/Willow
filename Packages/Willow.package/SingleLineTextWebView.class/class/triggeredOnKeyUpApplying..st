instance creation
triggeredOnKeyUpApplying: aComponentCommand

	self
		deprecated: 'Use TextFieldWebView'
		transformWith: 'SingleLineTextWebView triggeredOnKeyUpApplying:  ̀@aComponentCommand' -> 'TextFieldWebView singleLineTriggeringOnKeyUpApplying: ̀@aComponentCommand'.

	^ TextFieldWebView singleLineTriggeringOnKeyUpApplying: aComponentCommand