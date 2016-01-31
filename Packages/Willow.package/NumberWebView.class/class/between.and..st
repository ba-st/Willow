instance creation
between: aMinimum and: aMaximum

	| commands |
	commands := OrderedCollection with: 
					[:aComponent :aCanvas |
					aComponent
						min: aMinimum;
						max: aMaximum].
	^self applying: commands