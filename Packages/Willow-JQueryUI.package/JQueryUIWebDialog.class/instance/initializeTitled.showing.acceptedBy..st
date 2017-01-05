initialize-release
initializeTitled: aTitle showing: aWebView acceptedBy: anAcceptanceText

	title := aTitle.
	contentsView := aWebView.
	interactionInterpreter := WebInteractionInterpreter forAcceptanceOfDialogWith: anAcceptanceText