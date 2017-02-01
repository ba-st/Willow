Instance Creation
titled: aName
	applyingToEachCell: aCommandToCell
	renderingWith: aRenderingCommand
	applyingToHeading: aCommandToHeading

	^self new
		initializeNamed: aName
		applyingToEachCell: aCommandToCell
		renderingWith: aRenderingCommand
		applyingToHeading: aCommandToHeading