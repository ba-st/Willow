Configuring
addColumnTitled: aTitle renderingAll: renderingCommands applyingToCells: aCellCommand applyingToHeading: aHeadingCommand

	columnRenderers
		add:
			(WebTableMultiColumnRenderer
				titled: aTitle
				applyingToEachCell: aCellCommand
				renderingWithAll: renderingCommands
				applyingToHeading: aHeadingCommand)