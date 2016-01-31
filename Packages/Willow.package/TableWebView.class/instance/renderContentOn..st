rendering
renderContentOn: aCanvas

	| component |

	component := aCanvas table.
	propertyCommands do: [ :command | command applyTo: component on: aCanvas ].
	component
		with: [ self renderHeadOn: aCanvas.
			self renderBodyOn: aCanvas ]