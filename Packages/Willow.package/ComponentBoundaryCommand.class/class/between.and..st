instance creation
between: aMinimum and: aMaximum

	^ self
		restrictingMinimumWith: (Holder containing: aMinimum)
		maximumTo: (Holder containing: aMaximum)