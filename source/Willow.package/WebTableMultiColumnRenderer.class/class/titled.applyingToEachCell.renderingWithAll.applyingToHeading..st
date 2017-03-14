Instance Creation
titled: aTitle applyingToEachCell: aCommandToCell renderingWithAll: aRenderingCommandCollection applyingToHeading: aCommandToHeading

	AssertionChecker enforce: [ aRenderingCommandCollection size > 1 ] because: 'Don''t use this renderer with less than two column rendering commands. Use WebTableColumnRenderer instead.'.

	^ self new
		initializeTitled: aTitle
		applyingToEachCell: aCommandToCell
		renderingWithAll: aRenderingCommandCollection
		applyingToHeading: aCommandToHeading