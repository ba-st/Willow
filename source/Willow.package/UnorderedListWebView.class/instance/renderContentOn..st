rendering
renderContentOn: aCanvas

	| list |

	list := aCanvas unorderedList.
	"The order of the collaborations is relevant."
	identifierAssigner withAssignedIdentifierDo: [ :id | list id: id ].
	commandToList applyTo: list on: aCanvas.
	interactionInterpreter applyTo: list on: aCanvas.
	list with: [ elements do: [ :anElement | aCanvas render: (ListItemWebView itemizing: anElement containedIn: list applying: commandToItem) ] ]