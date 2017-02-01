initialization
initializeNamed: aTitle
	applyingToEachCell: aCommandToCell
	renderingWith: aRenderingCommand
	applyingToHeading: aCommandToHeading

	super initialize.
	title := aTitle.
	renderingCommand := aRenderingCommand.
	commandToHeading := aCommandToHeading.
	commandToCell := aCommandToCell