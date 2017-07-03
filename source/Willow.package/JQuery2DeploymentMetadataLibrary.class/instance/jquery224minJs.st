uploaded metadata
jquery224minJs

	^ WAFileLibraryResource
		filepath: 'jquery-2.2.4.min.js'
		mimeType: (WAMimeType main: 'application' sub: 'x-javascript')
		cacheDuration: self class defaultCacheDuration
		contents: (GRDelayedSend receiver: self selector: #jquery224minJsContent)