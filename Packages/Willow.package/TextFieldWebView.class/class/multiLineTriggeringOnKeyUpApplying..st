Instance Creation
multiLineTriggeringOnKeyUpApplying: aComponentCommand

	^ self forComponentBuiltUsing: [ :canvas | canvas textArea ] withInteractionDefinedBy: WebInteractionInterpreter forReleaseOfKeyInComponent applying: aComponentCommand