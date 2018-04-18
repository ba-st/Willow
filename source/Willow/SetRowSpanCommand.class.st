"
A command to set the rowSpan of a table cell.
"
Class {
	#name : #SetRowSpanCommand,
	#superclass : #WebComponentCommand,
	#instVars : [
		'rowSpan'
	],
	#category : 'Willow-Frontend'
}

{ #category : #'instance creation' }
SetRowSpanCommand class >> setting: aRowSpan [

	^ self new initializeSetting: aRowSpan
]

{ #category : #processing }
SetRowSpanCommand >> applyTo: aComponent on: aCanvas [

	aComponent rowSpan: rowSpan
]

{ #category : #initialization }
SetRowSpanCommand >> initializeSetting: aRowSpan [

	rowSpan := aRowSpan
]
