Single Selection-API
currentSelection

	^ self currentSelectionIfNone: [ SelectionIsInvalid signal: 'Nothing is selected' ]