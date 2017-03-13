configuring - private
configureValueOf: anInput

	chosenElementHolder
		withContentDo: [ :option | anInput value: (options indexOf: option) ]
		ifUnused: [ :explanations |  ]