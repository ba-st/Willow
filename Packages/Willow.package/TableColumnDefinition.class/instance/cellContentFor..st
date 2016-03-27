accessing
cellContentFor: anElement

	^ [ :canvas | 
	| cell content |

	cell := canvas tableData.
	content := cellContentProvider value: cell value: anElement.
	cell with: content ]