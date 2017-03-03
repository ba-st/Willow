Instance Creation
singleLineTriggeringOnChangeApplying: aComponentCommand

	^ self forComponentBuiltUsing: [ :canvas | canvas textInput ] withInteractionDefinedBy: WebInteractionInterpreter forChangeInComponentValue applying: aComponentCommand