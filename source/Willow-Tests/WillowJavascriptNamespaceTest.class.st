"
A WillowJavascriptNamespaceTest is a test class for testing the behavior of WillowJavascriptNamespace
"
Class {
	#name : #WillowJavascriptNamespaceTest,
	#superclass : #TestCase,
	#category : 'Willow-Tests-Applications'
}

{ #category : #'tests-Accessing' }
WillowJavascriptNamespaceTest >> testCallServerFunction [

	self
		assert: WillowJavascriptNamespace new callServerFunction asJavascript
		equals: 'Willow.callServer'
]

{ #category : #'tests-Accessing' }
WillowJavascriptNamespaceTest >> testHandleAjaxErrorCallFunction [

	self
		assert: WillowJavascriptNamespace new handleAjaxErrorCallFunction asJavascript
		equals: 'Willow.handleAjaxErrorCall'
]

{ #category : #'tests-printing' }
WillowJavascriptNamespaceTest >> testJavascriptContentOn [

	self assert: WillowJavascriptNamespace new asJavascript equals: 'Willow'
]

{ #category : #'tests-Configuring' }
WillowJavascriptNamespaceTest >> testSetCallServerFunctionTo [

	self
		assert:
			(WillowJavascriptNamespace new
				setCallServerFunctionTo: (JSFunction new arguments: #('arguments'))) asJavascript
		equals: 'Willow.callServer=function(arguments){}'
]

{ #category : #'tests-Configuring' }
WillowJavascriptNamespaceTest >> testSetHandleAjaxErrorCallFunctionTo [

	self
		assert:
			(WillowJavascriptNamespace new
				setHandleAjaxErrorCallFunctionTo: (JSFunction new arguments: #('xmlHttpRequest' 'textStatus' 'errorThrown')))
				asJavascript
		equals: 'Willow.handleAjaxErrorCall=function(xmlHttpRequest,textStatus,errorThrown){}'
]
