"
I'm a builder of component classification commands
"
Class {
	#name : #ComponentClassificationCommandBuilder,
	#superclass : #GRObject,
	#instVars : [
		'styleProviderBinding'
	],
	#category : #'Willow-Frontend'
}

{ #category : #private }
ComponentClassificationCommandBuilder >> commandStyledWith: aCssStyle [

	^ ComponentClassificationCommand toStyleWith: aCssStyle
]

{ #category : #Building }
ComponentClassificationCommandBuilder >> dialogContainer [

	^ self commandStyledWith: styleProviderBinding content dialogContainer
]

{ #category : #Building }
ComponentClassificationCommandBuilder >> disabledComponent [

	^ self commandStyledWith: styleProviderBinding content disabledComponent
]

{ #category : #Building }
ComponentClassificationCommandBuilder >> fadingNotification [

	^ self commandStyledWith: styleProviderBinding content fadingNotification
]

{ #category : #initialization }
ComponentClassificationCommandBuilder >> initialize [

	super initialize.
	styleProviderBinding := Binding to: WillowCssStyles
]

{ #category : #Building }
ComponentClassificationCommandBuilder >> loading [

	^ self commandStyledWith: styleProviderBinding content loading
]

{ #category : #Building }
ComponentClassificationCommandBuilder >> willow [

	^ self commandStyledWith: styleProviderBinding content willow
]
