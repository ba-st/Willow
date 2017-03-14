Single Selection-API
withCurrentSelectionDo: aBlock

	^ chosenElementHolder withContentDo: aBlock ifUnused: [  ]