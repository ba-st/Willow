configuring
styleAccordingTo: aCssStyleName

	self deprecated: 'Please provide the corresponding command on instance creation'.
	commandToComponent := CompositeComponentCommand
		applyingAll:
			{commandToComponent.
			(ComponentClassificationCommand toStyleWith: aCssStyleName)}