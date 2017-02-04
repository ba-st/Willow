rendering - private
renderRowFor: anElement on: aCanvas

	aCanvas tableRow: [ columnDefinitions do: [ :columnDefinition | columnDefinition renderCellFor: anElement on: aCanvas ] ]