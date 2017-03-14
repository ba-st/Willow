accessing - general
fieldAndLabel

	self
		deprecated: 'Use willow and a CSS rule combining the element type + the class'
		transformWith: 'WillowCssStyles fieldAndLabel' -> 'WillowCssStyles willow'.
	^ self willow