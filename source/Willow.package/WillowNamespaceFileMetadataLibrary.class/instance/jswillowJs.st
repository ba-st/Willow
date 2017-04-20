Accessing
jswillowJs

	^ WAFileLibraryResource
		filepath: 'js/willow.js'
		mimeType: WAMimeType textJavascript
		cacheDuration:
			(Duration
				days: 0
				hours: 0
				minutes: 30
				seconds: 0)
		contents: (GRDelayedSend receiver: self selector: #jswillowJsContent)