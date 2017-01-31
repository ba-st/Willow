instance creation
displayingAtOnce: aNumberOfElements applying: aCommandComponent

	^ self
		withInteractionDefinedBy: WebInteractionInterpreter forChangeInComponentValue
		applying: (SetComponentSizeCommand setting: aNumberOfElements) + aCommandComponent