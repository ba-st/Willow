instance creation
between: aMinimum and: aMaximum

	| commands |

	commands := OrderedCollection
		with: (ComponentBoundaryCommand between: aMinimum and: aMaximum).
	^ self applying: commands