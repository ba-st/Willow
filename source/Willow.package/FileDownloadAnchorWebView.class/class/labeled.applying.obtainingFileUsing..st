Instance Creation
labeled: aLabel applying: aComponentCommand obtainingFileUsing: aFileProvider

	^ self new
		initializeLabeled: aLabel
		applying: aComponentCommand asWebComponentCommand
		obtainingFileUsing: aFileProvider