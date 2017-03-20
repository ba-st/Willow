instance creation
nonNegative

	^ self restrictingMinimumWith: (Optional containing: 0) maximumTo: (Optional unusedBecause: 'Maximum not restricted')