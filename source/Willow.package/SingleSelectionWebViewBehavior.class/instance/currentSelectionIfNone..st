Single Selection-API
currentSelectionIfNone: aBlock

	^ chosenElementOptional withContentDo: [ :element | element ] ifUnused: aBlock