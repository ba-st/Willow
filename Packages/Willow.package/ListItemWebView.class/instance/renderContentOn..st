rendering
renderContentOn: aCanvas

	| component |

	component := aCanvas listItem.
	commandToComponent applyTo: component on: aCanvas.
	component with: itemView