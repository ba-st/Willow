"
A WillowJavascriptNamespaceTest is a test class for testing the behavior of WillowJavascriptNamespace
"
Class {
	#name : #WillowJavascriptNamespaceTest,
	#superclass : #JSObjectTest,
	#category : #'Willow-Tests-Applications'
}

{ #category : #'tests-Accessing' }
WillowJavascriptNamespaceTest >> testCallServerFunction [

	self assert: WillowJavascriptNamespace new callServerFunction equals: 'Willow.callServer'
]

{ #category : #'tests-printing' }
WillowJavascriptNamespaceTest >> testClassificationAccess [

	self assert: Willow classification >> #loading = 'willow-loading'
]

{ #category : #'tests-printing' }
WillowJavascriptNamespaceTest >> testConstantsAccess [

	self assert: WillowJavascriptNamespace new constants >> #css >> #auto = 'auto'
]

{ #category : #'tests-Accessing' }
WillowJavascriptNamespaceTest >> testHandleAjaxErrorCallFunction [

	self
		assert: WillowJavascriptNamespace new handleAjaxErrorCallFunction
		equals: 'Willow.handleAjaxErrorCall'
]

{ #category : #'tests-printing' }
WillowJavascriptNamespaceTest >> testJavascriptContentOn [

	self assert: WillowJavascriptNamespace new equals: 'Willow'
]

{ #category : #'tests-Configuring' }
WillowJavascriptNamespaceTest >> testSetCallServerFunctionTo [

	self
		assert:
			( WillowJavascriptNamespace new
				setCallServerFunctionTo: ( JSFunction new arguments: #('arguments') ) )
		equals: 'Willow.callServer=function(arguments){}'
]

{ #category : #'tests-Configuring' }
WillowJavascriptNamespaceTest >> testSetHandleAjaxErrorCallFunctionTo [

	self
		assert:
			( WillowJavascriptNamespace new
				setHandleAjaxErrorCallFunctionTo: ( JSFunction new arguments: #('xmlHttpRequest' 'textStatus' 'errorThrown') ) )
		equals: 'Willow.handleAjaxErrorCall=function(xmlHttpRequest,textStatus,errorThrown){}'
]
