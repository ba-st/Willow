accessing
urlOf: aSymbol using: aHandler

	^ aHandler baseUrlForLibrary
		addToPath: self name;
		addToPath: (self asFilename: aSymbol);
		yourself