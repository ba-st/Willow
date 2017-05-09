private
falseStatementContentOn: aStream

	falseStatementOptional
		withContentDo: [ :falseStatement | 
			aStream
				space;
				nextPutAll: 'else';
				space;
				nextPut: ${;
				javascript: falseStatement;
				nextPut: $} ]