initialization
initializeLabeled: aLabel applying: aComponentCommand

	label := aLabel.
	commandToComponent := aComponentCommand.
	interactionInterpreter := WebInteractionInterpreter forClickOnComponent.
	self onTrigger executeOnClient: [ :script :canvas | script << canvas jQuery event preventDefault ]