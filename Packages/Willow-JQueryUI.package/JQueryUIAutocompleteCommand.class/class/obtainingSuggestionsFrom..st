instance creation
obtainingSuggestionsFrom: anAutocompleteProvider

	^ self
		toExecute:
			[ :canvas | canvas jQuery this autocomplete sourceCallback: anAutocompleteProvider ]