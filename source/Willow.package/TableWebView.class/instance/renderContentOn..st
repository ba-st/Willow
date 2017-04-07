rendering
renderContentOn: aCanvas

	| table |

	table := aCanvas table.
	table id: (self identifyIn: aCanvas).
	interactionInterpreter applyTo: table on: aCanvas.
	commandToTable applyTo: table on: aCanvas.

	table
		with: [ aCanvas render: header.
			aCanvas tableBody: [ items do: [ :item | self renderRowFor: item on: aCanvas ] ] ]