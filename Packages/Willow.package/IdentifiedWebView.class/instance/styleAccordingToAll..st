configuring
styleAccordingToAll: aCssStyleNameCollection

	self deprecated: 'Please provide the corresponding command on instance creation'.
		commandToComponent := CompositeComponentCommand
		applyingAll:
			{commandToComponent.
			(ComponentClassificationCommand toStyleWithAll: aCssStyleNameCollection )}