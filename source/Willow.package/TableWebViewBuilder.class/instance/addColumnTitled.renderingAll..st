Configuring
addColumnTitled: aTitle renderingAll: renderingCommands

	self
		addColumnTitled: aTitle
		renderingAll: renderingCommands
		applyingToCells: CompositeComponentCommand empty
		applyingToHeading: CompositeComponentCommand empty