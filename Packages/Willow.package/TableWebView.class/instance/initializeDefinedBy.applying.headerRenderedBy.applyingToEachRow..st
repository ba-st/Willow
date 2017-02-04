initialize-release
initializeDefinedBy: aColumnRendererCollection applying: aTableCommand headerRenderedBy: aHeader applyingToEachRow: aRowCommand

	interested := Set new.
	columnRenderers := aColumnRendererCollection.
	commandToTable := aTableCommand.
	commandToRow := aRowCommand.
	header := aHeader.
	interactionInterpreter := WebInteractionInterpreter forClickOnComponent.
	self changeContentsTo: #()