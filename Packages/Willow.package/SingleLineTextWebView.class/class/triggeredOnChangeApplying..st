instance creation
triggeredOnChangeApplying: aComponentCommand

	self
		deprecated: 'Use TextFieldWebView'
		transformWith: 'SingleLineTextWebView triggeredOnChangeApplying:  ̀@aComponentCommand' -> 'TextFieldWebView singleLineTriggeringOnChangeApplying: ̀@aComponentCommand'.

	^ TextFieldWebView singleLineTriggeringOnChangeApplying: aComponentCommand