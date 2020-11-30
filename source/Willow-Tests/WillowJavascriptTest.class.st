Class {
	#name : #WillowJavascriptTest,
	#superclass : #JSObjectTest,
	#category : #'Willow-Tests-WebInteraction'
}

{ #category : #tests }
WillowJavascriptTest >> testJSConcatenateBefore [

	| jsObject |

	jsObject := ( ( JSStream this alias: 'theVariable' ) call: 'doIt' )
		addDecoration: ( JSConcatenateBefore on: ( JSStream this assignTo: 'theVariable' ) ).

	self assert: jsObject equals: 'theVariable=this;theVariable.doIt()'
]
