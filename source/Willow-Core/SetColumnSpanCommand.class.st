"
A command to set the colSpan of a table column.
"
Class {
	#name : #SetColumnSpanCommand,
	#superclass : #WebComponentCommand,
	#instVars : [
		'colSpan'
	],
	#category : #'Willow-Core-Frontend'
}

{ #category : #'instance creation' }
SetColumnSpanCommand class >> setting: aColSpan [

	^ self new initializeSetting: aColSpan
]

{ #category : #processing }
SetColumnSpanCommand >> applyTo: aComponent on: aCanvas [

	aComponent colSpan: colSpan
]

{ #category : #'initialize-release' }
SetColumnSpanCommand >> initializeSetting: aColSpan [

	colSpan := aColSpan
]
