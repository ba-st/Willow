instance creation
neverTriggered

	^self
		triggeredAccordingTo: NullTriggeringPolicy new
		serializingWith: NullWebInteractionCommand new