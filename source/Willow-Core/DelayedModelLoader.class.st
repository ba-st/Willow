Class {
	#name : 'DelayedModelLoader',
	#superclass : 'Object',
	#instVars : [
		'commands'
	],
	#category : 'Willow-Core-WebInteraction',
	#package : 'Willow-Core',
	#tag : 'WebInteraction'
}

{ #category : 'instance creation' }
DelayedModelLoader class >> new [

	^ super new initialize
]

{ #category : 'evaluating' }
DelayedModelLoader >> applyTo: aCollection on: aCanvas [

	commands
		do: [ :command | 
			aCollection
				addAll: ( command serverIndependentInstructions statementsOn: aCanvas );
				addAll: ( command modelLoadingInstructions statementsOn: aCanvas )
			]
]

{ #category : 'initialization' }
DelayedModelLoader >> initialize [

	super initialize.
	commands := OrderedCollection new
]

{ #category : 'configuring' }
DelayedModelLoader >> onTriggerExecute: anInteractionCommand [

	commands add: anInteractionCommand
]
