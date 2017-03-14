*Willow-JQueryUI
triggeredOnDialogAcceptWith: anAcceptButtonText

	^ self
		triggeredAccordingTo: (DialogAcceptButtonTrigger acceptedBy: anAcceptButtonText)
		serializingWith: SerializationCommand forChildForm