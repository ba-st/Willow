"
A command to set the size of a component, in combo boxes this implies the number of visible options.
"
Class {
	#name : #SetComponentSizeCommand,
	#superclass : #WebComponentCommand,
	#instVars : [
		'size'
	],
	#category : #'Willow-Frontend'
}

{ #category : #'instance creation' }
SetComponentSizeCommand class >> setting: aSize [

	^self new initializeSetting: aSize
]

{ #category : #processing }
SetComponentSizeCommand >> applyTo: aComponent on: aCanvas [

	aComponent size: size
]

{ #category : #'initialize-release' }
SetComponentSizeCommand >> initializeSetting: aSize [

	size := aSize
]
