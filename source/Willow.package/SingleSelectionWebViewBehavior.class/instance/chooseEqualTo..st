Single Selection-API
chooseEqualTo: anElement

	self
		chooseAnySatisfying: [ :element | element = anElement ]
		ifNone: [ SelectionIsInvalid signal: ('There''s no available object equal to <1p>' expandMacrosWith: anElement) ]