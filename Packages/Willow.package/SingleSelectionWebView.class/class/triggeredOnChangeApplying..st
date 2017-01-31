instance creation
triggeredOnChangeApplying: aComponentCommand

	^ self
		withInteractionDefinedBy: WebInteractionInterpreter forChangeInComponentValue
		applying: aComponentCommand