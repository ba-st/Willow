initialization
initializeApplying: aComponentCommand transformingWith: aTextCodec

	textField := TextFieldWebView singleLineTriggeringOnChangeApplying: aComponentCommand.
	textCodec := aTextCodec