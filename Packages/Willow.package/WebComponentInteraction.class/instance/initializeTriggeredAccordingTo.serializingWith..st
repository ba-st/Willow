initialize-release
initializeTriggeredAccordingTo: aTriggerPolicy serializingWith: aSerializationCommand

	triggerPolicy := aTriggerPolicy.
	commands := OrderedCollection new.
	serializationCommand := aSerializationCommand