Instance Creation
multiLineTriggeringOnChangeApplying: aComponentCommand

	^ self
		forComponentBuiltUsing: [ :canvas | canvas textArea ]
		withInteractionDefinedBy: WebInteractionInterpreter forChangeInComponentValue
		applying: aComponentCommand