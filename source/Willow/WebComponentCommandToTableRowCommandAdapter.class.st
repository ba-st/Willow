"
I'm an adapter for web component commands allowing to use it as table row commnands
"
Class {
	#name : #WebComponentCommandToTableRowCommandAdapter,
	#superclass : #TableRowCommand,
	#instVars : [
		'command'
	],
	#category : #'Willow-Frontend'
}

{ #category : #'Instance Creation' }
WebComponentCommandToTableRowCommandAdapter class >> adapting: aWebComponentCommand [

	^self new initializeAdapting: aWebComponentCommand
]

{ #category : #Applying }
WebComponentCommandToTableRowCommandAdapter >> applyTo: aTableRow for: aRelatedObject on: aCanvas [

	command applyTo: aTableRow on: aCanvas
]

{ #category : #initialization }
WebComponentCommandToTableRowCommandAdapter >> initializeAdapting: aWebComponentCommand [

	command := aWebComponentCommand
]
