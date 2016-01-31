accessing - private
resourceFoundAt: filename relatedTo: aSelector declaredAs: mimeType

	^WAFileLibraryResource
		filepath: aSelector
		mimeType: mimeType
		cacheDuration: self defaultDuration
		contents: (self contentsFoundAt: filename)