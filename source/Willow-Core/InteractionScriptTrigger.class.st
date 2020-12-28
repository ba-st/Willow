Class {
	#name : #InteractionScriptTrigger,
	#superclass : #TriggeringPolicy,
	#instVars : [
		'interacionSelector'
	],
	#category : #'Willow-Core-WebInteraction'
}

{ #category : #'instance creation' }
InteractionScriptTrigger class >> interactSending: anInteracionSelector [

	^ self new initializeInteractSending: anInteracionSelector
]

{ #category : #evaluating }
InteractionScriptTrigger >> apply: aJavascriptScript to: aComponent on: aCanvas [

	aCanvas ensureIdFor: aComponent.
	aComponent
		script: ( aCanvas jQuery this perform: interacionSelector with: ( aJavascriptScript asFunction: #(event) ) )
]

{ #category : #initialization }
InteractionScriptTrigger >> initializeInteractSending: anInteracionSelector [

	interacionSelector := anInteracionSelector
]
