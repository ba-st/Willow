Instance Creation
titled: aName
	applyingToEachCell: aCommandToCell
	renderingWith: aRenderingCommand
	applyingToHeading: aCommandToHeading

	^self new
		initializeTitled: aName
		applyingToEachCell: aCommandToCell
		renderingWith: aRenderingCommand
		applyingToHeading: aCommandToHeading