instance creation
named: aName offering: anOptionCollection

	^ self
		named: aName
		offering: anOptionCollection
		applying: (CompositeComponentCommand applyingAll: #())