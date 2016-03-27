instance creation
withTitleDefinedBy: aHeadingContentProvider cellsDefinedBy: aCellContentProvider

	^ self
		buildingHeadingWith: [ :canvas | 
			| heading |

			heading := canvas tableHeading.
			heading with: (aHeadingContentProvider value: heading) ]
		cellsDefinedBy: aCellContentProvider