uploaded metadata
jquery224Js

	^ WAFileLibraryResource
		filepath: 'jquery-2.2.4.js'
		mimeType: (WAMimeType main: 'application' sub: 'x-javascript')
		cacheDuration: self class defaultCacheDuration
		contents: (GRDelayedSend receiver: self selector: #jquery224JsContent)