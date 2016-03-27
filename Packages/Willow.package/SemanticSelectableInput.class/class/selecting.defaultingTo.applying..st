instance creation
selecting: anInputView defaultingTo: aDefaultModel applying: aComponentCommand

	^ self new
		initializeSelecting: anInputView
		defaultingTo: aDefaultModel
		applying: aComponentCommand