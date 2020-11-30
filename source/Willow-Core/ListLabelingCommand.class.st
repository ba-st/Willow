"
Command to configure how to render elements in a list
"
Class {
	#name : #ListLabelingCommand,
	#superclass : #WebComponentCommand,
	#instVars : [
		'renderingBlock'
	],
	#category : #'Willow-Core-Frontend'
}

{ #category : #'Instance Creation' }
ListLabelingCommand class >> with: aRenderingBlock [

	^ self new initializeWith: aRenderingBlock
]

{ #category : #processing }
ListLabelingCommand >> applyTo: aListComponent on: aCanvas [

	aListComponent labels: renderingBlock 
]

{ #category : #initialization }
ListLabelingCommand >> initializeWith: aRenderingBlock [
	
	renderingBlock := aRenderingBlock 
]
