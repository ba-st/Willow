rendering
renderContentOn: aCanvas

	| component |

	component := aCanvas image.
	imageInBase64 isEmpty
		ifFalse: [ component url: ('data:image/png;base64,<1s>' expandMacrosWith: imageInBase64) ]