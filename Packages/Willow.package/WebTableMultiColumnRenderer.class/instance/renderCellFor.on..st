rendering
renderCellFor: anItem on: aCanvas

	renderingCommands
		do: [ :renderingCommand | 
			| tableData |
			tableData := aCanvas tableData.
			commandToCell applyTo: tableData on: aCanvas.
			tableData with: (renderingCommand value: anItem) ]