configuring
onTrigger

	^ CombinedWebInteractionInterpreter
		combiningInterpretersOf: (Array with: checkboxView with: inputView)