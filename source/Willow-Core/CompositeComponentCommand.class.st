"
A command collecting several sub commands to a component.
"
Class {
	#name : #CompositeComponentCommand,
	#superclass : #WebComponentCommand,
	#instVars : [
		'commands'
	],
	#category : #'Willow-Core-Frontend'
}

{ #category : #'instance creation' }
CompositeComponentCommand class >> applyingAll: aCommandCollection [

	^ self new initializeApplyingAll: aCommandCollection
]

{ #category : #'instance creation' }
CompositeComponentCommand class >> empty [

	^ self applyingAll: #()
]

{ #category : #combining }
CompositeComponentCommand >> + aComponentCommand [

	^ self class
		applyingAll:
			(OrderedCollection new
				addAll: commands;
				add: aComponentCommand asWebComponentCommand;
				yourself)
]

{ #category : #processing }
CompositeComponentCommand >> applyTo: aComponent on: aCanvas [

	commands do: [ :command | command applyTo: aComponent on: aCanvas ]
]

{ #category : #'initialize-release' }
CompositeComponentCommand >> initializeApplyingAll: aCommandCollection [

	commands := OrderedCollection withAll: aCommandCollection
]
