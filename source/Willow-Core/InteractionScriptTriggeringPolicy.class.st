Class {
	#name : #InteractionScriptTriggeringPolicy,
	#superclass : #TriggeringPolicy,
	#instVars : [
		'eventName'
	],
	#category : #'Willow-Core-WebInteraction'
}

{ #category : #'instance creation' }
InteractionScriptTriggeringPolicy class >> interactCalling: anEventName [

	^ self new initializeInteractCalling: anEventName
]

{ #category : #evaluating }
InteractionScriptTriggeringPolicy >> apply: aJavascriptScript to: aComponent on: aCanvas [

	aCanvas ensureIdFor: aComponent.
	aComponent
		script: ( aCanvas jQuery this call: eventName with: ( aJavascriptScript asFunction: #(event) ) )
]

{ #category : #initialization }
InteractionScriptTriggeringPolicy >> initializeInteractCalling: anEventName [

	eventName := anEventName
]
