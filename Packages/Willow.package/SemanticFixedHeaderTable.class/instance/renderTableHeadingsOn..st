rendering - private
renderTableHeadingsOn: aCanvas

	columnDefinitions
		do: [ :columnDefinition | self renderHeadingFor: columnDefinition on: aCanvas ].
	self renderFillerHeadingOn: aCanvas