*ObjectHolding-Model
forcedAsNumber

	^ (self notEmpty and: [ self noneSatisfy: [ :each | each isLetter or: [ each isSeparator ] ] ])
		ifTrue: [ self asNumber ]
		ifFalse: [ 0 ]