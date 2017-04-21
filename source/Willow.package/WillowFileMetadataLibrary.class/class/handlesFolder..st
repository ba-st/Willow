Testing
handlesFolder: aSymbol

	^ self ~~ WillowFileMetadataLibrary and: [ self subclasses isEmpty and: [ self folderName = aSymbol greaseString ] ]