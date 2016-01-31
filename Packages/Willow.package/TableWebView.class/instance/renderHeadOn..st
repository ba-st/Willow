rendering - private
renderHeadOn: aCanvas

	aCanvas
		tableHead:
			[ columnDefinitions
				do: [ :columnDefinition | self renderHeadingFor: columnDefinition on: aCanvas ] ]