rendering - private
renderRowFor: anElement on: aCanvas

	aCanvas
		tableRow:
			[ columnDefinitions
				do: [ :columnDefinition | aCanvas render: (columnDefinition cellContentFor: anElement) ] ]