rendering
renderContentOn: aCanvas

	| component |

	component := aCanvas table.
	componentCommand applyTo: component on: aCanvas.
	component
		with: [ self renderHeadOn: aCanvas.
			self renderBodyOn: aCanvas ]