Configuring
addColumnTitled: aTitle rendering: aRenderingCommand applyingToCells: aCellCommand applyingToHeading: aHeadingCommand

	columnRenderers
		add:
			(WebTableColumnRenderer
				titled: aTitle
				applyingToEachCell: aCellCommand
				renderingWith: aRenderingCommand
				applyingToHeading: aHeadingCommand)