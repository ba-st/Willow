instance creation
triggeredOnKeyUpApplying: aComponentCommand

	^ self
		withInteractionDefinedBy: WebInteractionInterpreter forReleaseOfKeyInComponent
		applying: aComponentCommand