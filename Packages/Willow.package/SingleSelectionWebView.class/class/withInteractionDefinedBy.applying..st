instance creation - private
withInteractionDefinedBy: aUserInteractionPolicy applying: aComponentCommand

	^ self new
		initializeWithInteractionDefinedBy: aUserInteractionPolicy
		applying: aComponentCommand