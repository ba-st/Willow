instance creation - private
withInteractionDefinedBy: aUserInteractionPolicy applying: aComponentCommand

	^ super new
		initializeWithInteractionDefinedBy: aUserInteractionPolicy
		applying: aComponentCommand