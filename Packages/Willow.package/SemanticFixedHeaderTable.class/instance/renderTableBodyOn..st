rendering - private
renderTableBodyOn: aCanvas

	| tableComponent |

	"El orden es importante"
	tableComponent := aCanvas table.
	tableComponent class: SemanticStyle ui striped selectable definition fixed table.
	interactionInterpreter applyTo: tableComponent on: aCanvas.
	tableComponent with: [ aCanvas render: identifiedTableBody ]