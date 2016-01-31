instance creation
representing: anElement describedBy: aDescription in: aGroup applying: aCommandCollection

	^self new
		initializeRepresenting: anElement
		describedBy: aDescription
		in: aGroup
		applying: aCommandCollection