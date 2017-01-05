instance creation
triggeredOnClick

	^ self
		triggeredAccordingTo: InteractionScriptTrigger triggeringOnClick
		serializingWith: NullCommand new