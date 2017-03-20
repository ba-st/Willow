Single Selection-API
withCurrentSelectionDo: aBlock

	^ chosenElementOptional withContentDo: aBlock ifUnused: [  ]