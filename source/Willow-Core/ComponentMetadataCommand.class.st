"
A command to add attributes with custom information:
data-* = ""value""
"
Class {
	#name : #ComponentMetadataCommand,
	#superclass : #WebComponentCommand,
	#instVars : [
		'name',
		'content'
	],
	#category : #'Willow-Core-Frontend'
}

{ #category : #'instance creation' }
ComponentMetadataCommand class >> toDeclare: aName with: aContent [

	^ self new initializeToDeclare: aName with: aContent
]

{ #category : #processing }
ComponentMetadataCommand >> applyTo: aComponent on: aCanvas [

	(ComponentAttributeCommand named: self dataAttribute with: content)
		applyTo: aComponent
		on: aCanvas
]

{ #category : #private }
ComponentMetadataCommand >> dataAttribute [
	^ 'data-<1s>' expandMacrosWith: name
]

{ #category : #'initialize-release' }
ComponentMetadataCommand >> initializeToDeclare: aName with: aContent [

	name := aName.
	content := aContent
]
