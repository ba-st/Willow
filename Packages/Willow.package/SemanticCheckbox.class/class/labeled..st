instance creation
labeled: aLabel

	^ self
		labeledWithContentOf: (Holder containing: aLabel)
		applying: (CompositeComponentCommand applyingAll: #())