private
renderRowFor: anItem on: aCanvas

	| row |

	row := aCanvas tableRow.
	commandToRow applyTo: row for: anItem on: aCanvas.
	row with: [columnRenderers do: [:renderer | renderer renderCellFor: anItem on: aCanvas]]