rendering
renderContentOn: aCanvas

	| table |

	table := aCanvas table.
	aCanvas ensureIdFor: table.
	interactionInterpreter applyTo: table on: aCanvas.
	commandToTable applyTo: table on: aCanvas.

	table with: [
		aCanvas render: header.
		aCanvas tableBody: [items do: [:item | self renderRowFor: item on: aCanvas]]]