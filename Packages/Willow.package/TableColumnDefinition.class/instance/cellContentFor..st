accessing
cellContentFor: anElement

	^ [ :canvas | canvas tableData: (cellContentProvider value: anElement) ]