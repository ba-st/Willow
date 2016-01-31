instance creation
describedBy: aDescription

	^ self describedBy: aDescription applying: (Array with: (self textButtonCommandFor: aDescription))