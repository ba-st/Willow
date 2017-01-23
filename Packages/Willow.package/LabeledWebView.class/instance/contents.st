accessing
contents

	self
		deprecated: 'Use viewToLabel'
		transformWith: '`@receiver contents' -> '`@receiver viewToLabel contents'.
	^viewToLabel contents