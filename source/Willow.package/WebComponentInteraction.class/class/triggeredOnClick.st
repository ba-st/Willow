instance creation
triggeredOnClick

	^ self
		triggeredAccordingTo: InteractionScriptTrigger triggeringOnClick
		serializingWith: NullWebInteractionCommand new