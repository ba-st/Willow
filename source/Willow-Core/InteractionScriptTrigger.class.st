Class {
	#name : #InteractionScriptTrigger,
	#superclass : #TriggeringPolicy,
	#instVars : [
		'interacionSelector'
	],
	#category : #'Willow-Core-WebInteraction'
}

{ #category : #'instance creation - private' }
InteractionScriptTrigger class >> interactSending: anInteracionSelector [

	^ self new initializeInteractSending: anInteracionSelector
]

{ #category : #'instance creation' }
InteractionScriptTrigger class >> triggeringOnChange [

	^ self interactSending: #onChange:
]

{ #category : #'instance creation' }
InteractionScriptTrigger class >> triggeringOnClick [

	^ self interactSending: #onClick:
]

{ #category : #'instance creation' }
InteractionScriptTrigger class >> triggeringOnDoubleClick [

	^ self interactSending: #onDoubleClick:
]

{ #category : #'instance creation' }
InteractionScriptTrigger class >> triggeringOnKeyUp [

	^ self interactSending: #onKeyUp:
]

{ #category : #evaluating }
InteractionScriptTrigger >> apply: aJavascriptScript to: aComponent on: aCanvas [

	aCanvas ensureIdFor: aComponent.
	aComponent
		script:
			(aCanvas jQuery this
				perform: interacionSelector
				with: (aJavascriptScript asFunction: #(event)))
]

{ #category : #initialization }
InteractionScriptTrigger >> initializeInteractSending: anInteracionSelector [

	interacionSelector := anInteracionSelector
]
