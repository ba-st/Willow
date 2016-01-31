printing
javascriptContentOn: aStream

	aStream
		nextPutAll: functionName;
		nextPut: $(.
	parameters do: [:parameter | aStream print: parameter]
		separatedBy: [aStream nextPut: $,].
	aStream nextPut: $)