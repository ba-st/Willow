rendering
renderContentOn: aCanvas

	"The order is relevant"

	| component |

	component := aCanvas unorderedList.
	commandToComponent applyTo: component on: aCanvas.
	component with: listItemViews