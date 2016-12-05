instance creation
triggeredOnChange

	^ self
		triggeredAccordingTo: InteractionScriptTrigger triggeringOnChange
		serializingWith: SerializationCommand forCurrentObject