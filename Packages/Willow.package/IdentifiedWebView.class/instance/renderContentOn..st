rendering
renderContentOn: aCanvas

	| identifier containerComponent |
	identifier := self updatedIdentifierUsing: aCanvas nextId.
	containerComponent := containerComponentProvider value: aCanvas.
	propertyCommands do: [:command | command value: containerComponent].
	containerComponent
		id: identifier;
		with: view