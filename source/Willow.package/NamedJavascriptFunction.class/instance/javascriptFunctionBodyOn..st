private
javascriptFunctionBodyOn: aStream

	aStream nextPut: ${.
	statements isEmpty
		ifFalse: [ statements allButLast
				do: [ :each | 
					aStream
						javascript: each;
						nextPut: $; ].
			self return
				ifTrue: [ aStream nextPutAll: 'return ' ].
			aStream javascript: statements last ].
	aStream nextPut: $}