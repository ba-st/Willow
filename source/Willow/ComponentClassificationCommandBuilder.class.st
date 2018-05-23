"
I'm a builder of component classification commands
"
Class {
	#name : #ComponentClassificationCommandBuilder,
	#superclass : #GRObject,
	#instVars : [
		'classesProvider'
	],
	#category : #'Willow-Frontend'
}

{ #category : #private }
ComponentClassificationCommandBuilder >> commandStyledWith: aSymbol [

	^ ComponentClassificationCommand toStyleWith: classesProvider >> aSymbol
]

{ #category : #Building }
ComponentClassificationCommandBuilder >> dialogContainer [

	^ self commandStyledWith: #dialogContainer
]

{ #category : #Building }
ComponentClassificationCommandBuilder >> disabledComponent [

	^ self commandStyledWith: classesProvider content disabledComponent
]

{ #category : #Building }
ComponentClassificationCommandBuilder >> fadingNotification [

	^ self commandStyledWith: classesProvider content fadingNotification
]

{ #category : #initialization }
ComponentClassificationCommandBuilder >> initialize [

	super initialize.
	classesProvider := Willow classes
]

{ #category : #Building }
ComponentClassificationCommandBuilder >> loading [

	^ self commandStyledWith: classesProvider content loading
]

{ #category : #Building }
ComponentClassificationCommandBuilder >> willow [

	^ self commandStyledWith: classesProvider content willow
]
