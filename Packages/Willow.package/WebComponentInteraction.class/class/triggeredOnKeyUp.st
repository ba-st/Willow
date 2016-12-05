instance creation
triggeredOnKeyUp

	^ self
		triggeredAccordingTo: InteractionScriptTrigger triggeringOnKeyUp
		serializingWith: SerializationCommand forCurrentObject