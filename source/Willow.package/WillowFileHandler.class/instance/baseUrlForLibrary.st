accessing
baseUrlForLibrary

	^baseUrlForLibraryOptional withContentDo: [:url | url copy] ifUnused: [super baseUrlForLibrary]