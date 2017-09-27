Instance Creation
titled: aName renderingItemWith: aRenderingCommand

	^ self
		titled: aName
		applyingToEachCell: [ :cell |  ]
		renderingWith: aRenderingCommand
		applyingToHeading: [ :heading |  ]