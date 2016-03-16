initialize-release
initializeWrapping: aView applying: aComponentCommand

	inputView := aView.
	componentCommand := CompositeComponentCommand
		applyingAll:
			(Array with: self uiInputStyleCommand with: aComponentCommand)