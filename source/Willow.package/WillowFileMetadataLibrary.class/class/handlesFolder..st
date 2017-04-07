Testing
handlesFolder: aSymbol

	^ self ~~ WillowFileMetadataLibrary and: [ self libraryKey = aSymbol ]