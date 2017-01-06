instance creation
triggeredOnDoubleClick

	^ self
		triggeredAccordingTo: InteractionScriptTrigger triggeringOnDoubleClick
		serializingWith: NullWebInteractionCommand new