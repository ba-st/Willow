instance creation
triggeredOnDialogAcceptBy: anAcceptanceText

	^ self triggeredAccordingTo: (DialogAcceptingTrigger presenting: anAcceptanceText)