"
A command to add attributes with custom information:
aria-* = ""value""
"
Class {
	#name : #ComponentAccessibilityEnrichmentCommand,
	#superclass : #WebComponentCommand,
	#instVars : [
		'name',
		'content'
	],
	#category : #'Willow-Frontend'
}

{ #category : #'instance creation' }
ComponentAccessibilityEnrichmentCommand class >> toDeclare: aName with: aContent [

	^ self new initializeToDeclare: aName with: aContent
]

{ #category : #processing }
ComponentAccessibilityEnrichmentCommand >> applyTo: aComponent on: aCanvas [

	(ComponentAttributeCommand named: self ariaAttribute with: content)
		applyTo: aComponent
		on: aCanvas
]

{ #category : #private }
ComponentAccessibilityEnrichmentCommand >> ariaAttribute [

	^ 'aria-<1s>' expandMacrosWith: name
]

{ #category : #initialization }
ComponentAccessibilityEnrichmentCommand >> initializeToDeclare: aName with: aContent [

	name := aName.
	content := aContent
]
