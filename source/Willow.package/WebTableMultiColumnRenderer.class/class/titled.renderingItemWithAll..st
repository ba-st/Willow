Instance Creation
titled: aName renderingItemWithAll: aRenderingCommandCollection

	^ self
		titled: aName
		applyingToEachCell: [ :cell |  ]
		renderingWithAll: aRenderingCommandCollection
		applyingToHeading: [ :heading |  ]