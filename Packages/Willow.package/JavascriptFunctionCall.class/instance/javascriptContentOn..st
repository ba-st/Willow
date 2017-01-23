printing
javascriptContentOn: aStream

	aStream
		nextPutAll: functionName;
		nextPut: $(.
	parameters do: [ :parameter | parameter javascriptOn: aStream ] separatedBy: [ aStream nextPut: $, ].
	aStream nextPut: $)