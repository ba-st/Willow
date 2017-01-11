instance creation
describedBy: aDescription

	self deprecated: 'Please use labeled: instead.' transformWith: '`@receiver describedBy: `@aDescription' -> '`@receiver labeled: `@aDescription'.
	^ self labeled: aDescription