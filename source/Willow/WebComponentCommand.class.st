"
Abstract for the component commands, each subclass should do a single change to a tag element.
"
Class {
	#name : #WebComponentCommand,
	#superclass : #GRObject,
	#category : 'Willow-Frontend'
}

{ #category : #combining }
WebComponentCommand >> + aComponentCommand [

	^ CompositeComponentCommand applyingAll: (Array with: self with: aComponentCommand asWebComponentCommand)
]

{ #category : #processing }
WebComponentCommand >> applyTo: aComponent on: aCanvas [

	self subclassResponsibility
]

{ #category : #converting }
WebComponentCommand >> asTableRowCommand [

	^WebComponentCommandToTableRowCommandAdapter adapting: self
]

{ #category : #converting }
WebComponentCommand >> asWebComponentCommand [

	^ self
]
