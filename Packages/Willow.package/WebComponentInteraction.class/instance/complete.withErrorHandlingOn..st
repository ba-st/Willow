accessing - private
complete: aCanvas withErrorHandlingOn: asynchronousCall

	asynchronousCall onError: (aCanvas javascript << 'invalidAction(x,t,e)' asFunction: (Array with: 'x' with: 't' with: 'e'))