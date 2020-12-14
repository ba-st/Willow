"
I represent a basic Session for Willow. 
"
Class {
	#name : #WillowSession,
	#superclass : #WASession,
	#instVars : [
		'componentSupplier'
	],
	#category : #'Willow-Core-Applications'
}

{ #category : #accessing }
WillowSession >> componentSupplier [

	^ componentSupplier
]

{ #category : #Controlling }
WillowSession >> startUpApplicationContextFor: aWillowApplication [

	"This hook provides the capability to set-up an application specific context"

	componentSupplier := aWillowApplication componentSupplierForApplication
]
