Instance creation
applyingToEachRadioButton: aCommandToComponent

	^ self applyingToEachRadioButton: aCommandToComponent renderingLabelsWith: [ :element | element ]