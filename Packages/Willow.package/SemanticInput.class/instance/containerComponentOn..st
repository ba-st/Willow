accessing - private
containerComponentOn: aCanvas

	| containerComponent |

	containerComponent := aCanvas div.
	componentCommand applyTo: containerComponent on: aCanvas.
	^ containerComponent