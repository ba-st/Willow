Single Selection-API
currentSelectionIfNone: aBlock

	^ chosenElementHolder withContentDo: [ :element | element ] ifUnused: aBlock