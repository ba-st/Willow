initialize-release
initializeSelecting: anInputView defaultingTo: aDefaultModel applying: aComponentCommand

	componentCommand := aComponentCommand.
	defaultModel := aDefaultModel.
	inputView := anInputView.
	self initializeCheckboxView