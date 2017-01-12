instance creation
displaying: anImageInBase64

	self
		deprecated: 'Please use ImageWebView'
		transformWith: 'Base64ImageWebView displaying: `@anImageInBase64' -> 'ImageWebView ofType: WAMimeType imagePng base64EncodedAs: `@anImageInBase64 applying: CompositeComponentCommand empty'.
	^ ImageWebView ofType: WAMimeType imagePng base64EncodedAs: anImageInBase64 applying: CompositeComponentCommand empty