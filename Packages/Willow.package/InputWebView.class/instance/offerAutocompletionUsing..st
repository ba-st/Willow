configuring
offerAutocompletionUsing: anAutocompleteProvider

	propertyCommands add: 
			[:aComponent :aCanvas |
			aComponent script: (aCanvas jQuery this autocomplete
						sourceCallback: anAutocompleteProvider)]