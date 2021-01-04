Class {
	#name : #InteractionScriptTrigger,
	#superclass : #TriggeringPolicy,
	#instVars : [
		'eventName'
	],
	#category : #'Willow-Core-WebInteraction'
}

{ #category : #'instance creation' }
InteractionScriptTrigger class >> interactCalling: anEventName [

	^ self new initializeInteractCalling: anEventName
]

{ #category : #evaluating }
InteractionScriptTrigger >> apply: aJavascriptScript to: aComponent on: aCanvas [

	aCanvas ensureIdFor: aComponent.
	aComponent
		script: ( aCanvas jQuery this call: eventName with: ( aJavascriptScript asFunction: #(event) ) )
]

{ #category : #initialization }
InteractionScriptTrigger >> initializeInteractCalling: anEventName [

	eventName := anEventName
]
