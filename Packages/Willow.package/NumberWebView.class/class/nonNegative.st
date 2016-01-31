instance creation
nonNegative

	| commands |
	commands := OrderedCollection
				with: [:aComponent :aCanvas | aComponent min: 0].
	^self applying: commands