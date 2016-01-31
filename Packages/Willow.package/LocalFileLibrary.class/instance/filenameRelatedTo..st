accessing - private
filenameRelatedTo: aSelector

	| stream |
	stream := WriteStream on: String new.
	stream
		nextPut: $.;
		nextPutAll: self fileNameSeparator;
		nextPutAll: 'Resources';
		nextPutAll: self fileNameSeparator;
		nextPutAll: aSelector.
	^stream contents