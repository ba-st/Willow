"
A command to set the tab index/order of a component.
"
Class {
	#name : #SetComponentTabIndexCommand,
	#superclass : #WebComponentCommand,
	#instVars : [
		'index'
	],
	#category : #'Willow-Core-Frontend'
}

{ #category : #'instance creation' }
SetComponentTabIndexCommand class >> setting: anIndex [

	^self new initializeSetting: anIndex
]

{ #category : #processing }
SetComponentTabIndexCommand >> applyTo: aComponent on: aCanvas [

	aComponent tabIndex: index
]

{ #category : #'initialize-release' }
SetComponentTabIndexCommand >> initializeSetting: anIndex [

	index := anIndex
]
