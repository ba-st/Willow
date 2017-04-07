initialize-release
initializeDefinedBy: aColumnRendererCollection applying: aTableCommand headerRenderedBy: aHeader applyingToEachRow: aRowCommand

	interested := Set new.
	columnRenderers := aColumnRendererCollection.
	commandToTable := aTableCommand.
	commandToRow := aRowCommand.
	header := aHeader.
	interactionInterpreter := WebInteractionInterpreter forClickOnComponent.
	identifierAssigner := IdentifierAssigner prefixedBy: 'table'.
	self changeContentsTo: #()