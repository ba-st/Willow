instance creation
describedBy: aDescription applying: aCommandToComponentCollection

	self
		deprecated: 'Use labeled:applying:'
		transformWith: '`@receiver describedBy: `@aDescription applying: `@aCommandToComponentCollection' -> '`@receiver labeled: `@aDescription applying: `@aCommandToComponentCollection'.
	^ self labeled: aDescription applying: (CompositeComponentCommand applyingAll: aCommandToComponentCollection)