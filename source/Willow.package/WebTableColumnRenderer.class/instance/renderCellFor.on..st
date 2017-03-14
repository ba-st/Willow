rendering
renderCellFor: anItem on: aCanvas

	| tableData |

	tableData := aCanvas tableData.
	commandToCell applyTo: tableData on: aCanvas.
	tableData with: (renderingCommand value: anItem)