Extension { #name : #JSObject }

{ #category : #'*Willow' }
JSObject >> willow [

	^ (WillowJavascriptNamespace context: self renderContext)
		rendererClass: self rendererClass;
		yourself
]
