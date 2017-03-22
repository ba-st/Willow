instance creation
between: aMinimum and: aMaximum

	^ self
		restrictingMinimumWith: (Optional containing: aMinimum)
		maximumTo: (Optional containing: aMaximum)