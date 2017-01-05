rendering
renderContentOn: aCanvas

	| containerComponent |

	containerComponent := self containerComponentOn: aCanvas.
	containerComponent with:
		[ self renderInputOn: aCanvas ]