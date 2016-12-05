instance creation
triggeredOnDoubleClick

	^ self
		triggeredAccordingTo: InteractionScriptTrigger triggeringOnDoubleClick
		serializingWith: NullCommand new