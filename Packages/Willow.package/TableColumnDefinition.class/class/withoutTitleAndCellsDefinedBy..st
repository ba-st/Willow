instance creation
withoutTitleAndCellsDefinedBy: aCellContentProvider

	^ self buildingHeadingWith: [ :canvas |  ] cellsDefinedBy: aCellContentProvider