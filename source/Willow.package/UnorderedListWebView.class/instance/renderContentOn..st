rendering
renderContentOn: aCanvas

	| list |

	list := aCanvas unorderedList.
	identifierAssigner withAssignedIdentifierDo: [ :id | list id: id ].
	
	"The order of the collaborations is relevant."
	commandToList applyTo: list on: aCanvas.
	interactionInterpreter applyTo: list on: aCanvas.
	list with: [ elements do: [ :anElement | aCanvas render: (ListItemWebView itemizing: anElement containedIn: list applying: commandToItem) ] ]