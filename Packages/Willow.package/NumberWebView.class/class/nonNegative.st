instance creation
nonNegative

	| commands |

	commands := OrderedCollection with: ComponentBoundaryCommand nonNegative.
	^ self applying: commands