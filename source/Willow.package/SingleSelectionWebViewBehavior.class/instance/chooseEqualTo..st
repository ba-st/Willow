Single Selection-API
chooseEqualTo: anElement

	self chooseAnySatisfying: [ :element | element = anElement  ] ifNone: [  ]