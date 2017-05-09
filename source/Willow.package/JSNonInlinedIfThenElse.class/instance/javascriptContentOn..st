printing
javascriptContentOn: aStream

	aStream
		nextPutAll: 'if';
		nextPut: $(.
	super javascriptContentOn: aStream.
	aStream
		nextPut: $);
		nextPut: ${;
		javascript: trueStatement;
		nextPut: $}.
	self falseStatementContentOn: aStream