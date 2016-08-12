initialize-release
initializeFromBase64String: aString

	segments := OrderedCollection new
		addAll: (self allButLastSegmentsOf: aString);
		add: (self lastSegmentOf: aString);
		asArray