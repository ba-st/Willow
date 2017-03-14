*Willow-SeasideExtensions
ensureIdFor: aComponent

	aComponent id
		ifNil: [ | id |
			id := IdentifierAssigner new identifierFor: aComponent on: self.
			aComponent id: id ]