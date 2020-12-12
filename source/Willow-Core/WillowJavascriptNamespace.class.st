"
I represent the Willow JS module
"
Class {
	#name : #WillowJavascriptNamespace,
	#superclass : #JSObject,
	#category : #'Willow-Core-Applications'
}

{ #category : #Accessing }
WillowJavascriptNamespace >> callServerFunction [

	^ self access: self constants >> #willow >> #callServerFunctionName
]

{ #category : #Accessing }
WillowJavascriptNamespace >> handleAjaxErrorCallFunction [

	^ self access: self constants >> #willow >> #handleAjaxErrorCallFunctionName
]

{ #category : #printing }
WillowJavascriptNamespace >> javascriptContentOn: aStream [

	aStream nextPutAll: 'Willow'
]

{ #category : #Accessing }
WillowJavascriptNamespace >> serverCall [

	^ (WillowServerCall context: self renderContext owner: self)
		rendererClass: self rendererClass;
		yourself
]

{ #category : #Configuring }
WillowJavascriptNamespace >> setCallServerFunctionTo: aJSFunction [

	^ self callServerFunction assign: aJSFunction
]

{ #category : #Configuring }
WillowJavascriptNamespace >> setHandleAjaxErrorCallFunctionTo: aJSFunction [

	^ self handleAjaxErrorCallFunction assign: aJSFunction
]
