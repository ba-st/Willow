instance creation
triggeredOnDocumentLoad

	^self
		triggeredAccordingTo: DocumentLoadTrigger new
		serializingWith: NullWebInteractionCommand new