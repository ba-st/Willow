Class {
	#name : 'WillowJavascriptTest',
	#superclass : 'JSObjectTest',
	#category : 'Willow-Core-Tests-WebInteraction',
	#package : 'Willow-Core-Tests',
	#tag : 'WebInteraction'
}

{ #category : 'tests' }
WillowJavascriptTest >> testJSConcatenateBefore [

	| jsObject |

	jsObject := ( ( JSStream this alias: 'theVariable' ) call: 'doIt' )
		addDecoration: ( JSConcatenateBefore on: ( JSStream this assignTo: 'theVariable' ) ).

	self assert: jsObject equals: 'theVariable=this;theVariable.doIt()'
]
