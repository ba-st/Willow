Instance Creation
singleLineTriggeringOnKeyUpApplying: aComponentCommand

	^ self forComponentBuiltUsing: [ :canvas | canvas textInput ] withInteractionDefinedBy: WebInteractionInterpreter forReleaseOfKeyInComponent applying: aComponentCommand