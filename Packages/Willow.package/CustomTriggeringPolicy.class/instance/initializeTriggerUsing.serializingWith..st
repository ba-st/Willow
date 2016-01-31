initialize-release
initializeTriggerUsing: aTriggeringCommand serializingWith: aSerializationCommand

	super initializeSerializingWith: aSerializationCommand.

	triggerCommand := aTriggeringCommand.
	serializationCommand := aSerializationCommand