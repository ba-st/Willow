handling
handle: aRequestContext

	| filepath fileResource |
	filepath := self fileRequestedIn: aRequestContext.
	fileResource := self fileResourceOf: filepath.

	aRequestContext respond: 
			[:response |
			response
				cacheFor: fileResource cacheDuration;
				document: fileResource contents mimeType: fileResource mimeType]