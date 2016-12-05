instance creation
triggeredOnDialogAcceptWith: anAcceptButtonText

	^ self
		triggeredAccordingTo: (DialogAcceptButtonTrigger acceptedBy: anAcceptButtonText)
		serializingWith: SerializationCommand forChildForm