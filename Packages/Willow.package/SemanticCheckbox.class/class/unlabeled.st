instance creation
unlabeled

	^ self
		labeledWithContentOf: self noLabelHolder
		applying: (CompositeComponentCommand applyingAll: #())