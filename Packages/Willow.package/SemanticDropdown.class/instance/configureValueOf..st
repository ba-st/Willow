configuring - private
configureValueOf: anInput

	selectionHolder
		withContentDo: [ :option | anInput value: (options indexOf: option) ]
		ifUnused: [ :explanations |  ]