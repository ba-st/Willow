Class {
	#name : #DelayedModelLoader,
	#superclass : #Object,
	#instVars : [
		'commands'
	],
	#category : #'Willow-WebInteraction'
}

{ #category : #'instance creation' }
DelayedModelLoader class >> new [

	^ super new initialize
]

{ #category : #evaluating }
DelayedModelLoader >> applyTo: aScript on: aCanvas [

	self
		commandsDo: [ :command | command serverIndependentActions do: [ :action | action value: aScript value: aCanvas ] ];
		commandsDo: [ :command | command clientIndependentActions do: [ :action | action value ] ];
		commandsDo: [ :command | command modelLoadingActions do: [ :action | action value: aScript value: aCanvas ] ]
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
