Preconditions
assertInitializationOfAll: anIdentifiedViewCollection
	anIdentifiedViewCollection do: [ :anIdentifiedView | anIdentifiedView ifNil: [ self error: 'View initialization order is incorrect, please review' ] ]