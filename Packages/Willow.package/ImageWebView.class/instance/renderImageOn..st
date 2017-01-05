rendering
renderImageOn: aCanvas

	| component |

	component := aCanvas image.
	component url: imageLocation.
	commandToComponent applyTo: component on: aCanvas.
	^ component