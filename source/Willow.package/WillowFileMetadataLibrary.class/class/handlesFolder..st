Testing
handlesFolder: aSymbol

	^ self ~~ WillowFileMetadataLibrary and: [ self subclasses isEmpty and: [ self libraryKey = aSymbol ] ]