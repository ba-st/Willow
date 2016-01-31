accessing
builtHolder

	self initializeCombinedHolder.
	holders do: [:holder | self updateCombinedHolderConsidering: holder].
	^combinedHolder