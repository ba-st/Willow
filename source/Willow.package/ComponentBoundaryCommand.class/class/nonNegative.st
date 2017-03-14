instance creation
nonNegative

	^ self
		restrictingMinimumWith: (Holder containing: 0)
		maximumTo: (UnusedHolder explainedBy: 'Maximum not restricted')