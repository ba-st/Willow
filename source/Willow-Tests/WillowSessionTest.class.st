"
A WillowSessionTest is a test class for testing the behavior of WillowSession
"
Class {
	#name : #WillowSessionTest,
	#superclass : #TestCase,
	#instVars : [
		'componentSupplier'
	],
	#category : #'Willow-Tests-Applications'
}

{ #category : #accessing }
WillowSessionTest >> componentSupplierForApplication [

	^ componentSupplier
]

{ #category : #initialization }
WillowSessionTest >> setUp [

	super setUp.
	componentSupplier := Html5ComponentSupplier new
]

{ #category : #tests }
WillowSessionTest >> testStartUpApplicationContextFor [

	| session |

	session := WillowSession new.
	session startUpApplicationContextFor: self.
	self assert: session componentSupplier equals: componentSupplier
]
