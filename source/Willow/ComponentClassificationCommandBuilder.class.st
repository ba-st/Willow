"
I'm a builder of component classification commands
"
Class {
	#name : #ComponentClassificationCommandBuilder,
	#superclass : #GRObject,
	#instVars : [
		'classificationNamespace'
	],
	#pools : [
		'Willow'
	],
	#category : #'Willow-Frontend'
}

{ #category : #private }
ComponentClassificationCommandBuilder >> commandStyledWith: aSymbol [

	^ ComponentClassificationCommand toStyleWith: classificationNamespace >> aSymbol
]

{ #category : #Building }
ComponentClassificationCommandBuilder >> dialogContainer [

	^ self commandStyledWith: #dialogContainer
]

{ #category : #Building }
ComponentClassificationCommandBuilder >> disabledComponent [

	^ self commandStyledWith: #disabledComponent
]

{ #category : #Building }
ComponentClassificationCommandBuilder >> fadingNotification [

	^ self commandStyledWith: #fadingNotification
]

{ #category : #initialization }
ComponentClassificationCommandBuilder >> initialize [

	super initialize.
	classificationNamespace := Classification
]

{ #category : #Building }
ComponentClassificationCommandBuilder >> loading [

	^ self commandStyledWith: #loading
]

{ #category : #Building }
ComponentClassificationCommandBuilder >> willow [

	^ self commandStyledWith: #willow
]
