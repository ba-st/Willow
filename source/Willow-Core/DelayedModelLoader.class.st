Class {
	#name : #DelayedModelLoader,
	#superclass : #Object,
	#instVars : [
		'commands'
	],
	#category : #'Willow-Core-WebInteraction'
}

{ #category : #'instance creation' }
DelayedModelLoader class >> new [

	^ super new initialize
]

{ #category : #evaluating }
DelayedModelLoader >> applyTo: aCollection on: aCanvas [

	commands
		do: [ :command | 
			OrderedCollection new
				addAll: command serverIndependentActions;
				addAll: command modelLoadingActions;
				do: [ :action | aCollection add: ( action cull: aCanvas ) ]
			]
]

{ #category : #private }
DelayedModelLoader >> commandsDo: aBlock [
	commands do: aBlock
]

{ #category : #'initialize-release' }
DelayedModelLoader >> initialize [

	super initialize.
	commands := OrderedCollection new
]

{ #category : #configuring }
DelayedModelLoader >> onTriggerExecute: anInteractionCommand [

	commands add: anInteractionCommand
]
