"
A command to set the style of a component.
"
Class {
	#name : #SetComponentStyleCommand,
	#superclass : #WebComponentCommand,
	#instVars : [
		'style'
	],
	#category : #'Willow-Core-Frontend'
}

{ #category : #'Instance Creation' }
SetComponentStyleCommand class >> setting: aStyle [

	^self new initializeSetting: aStyle
]

{ #category : #processing }
SetComponentStyleCommand >> applyTo: aComponent on: aCanvas [

	aComponent style: style  
]

{ #category : #initialization }
SetComponentStyleCommand >> initializeSetting: aStyle [

	style := aStyle
]
