evaluating
apply: anAsynchronousCall to: aComponent on: aCanvas

	aComponent perform: functionSelector with: (anAsynchronousCall asFunction: argumentNames)