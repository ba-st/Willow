"
Command to set the callback of a component
"
Class {
	#name : #ComponentCallbackSettingCommand,
	#superclass : #WebComponentCommand,
	#instVars : [
		'callback'
	],
	#category : #'Willow-Frontend'
}

{ #category : #'instance creation' }
ComponentCallbackSettingCommand class >> setting: aCallback [

	^self new initializeSetting: aCallback
]

{ #category : #processing }
ComponentCallbackSettingCommand >> applyTo: aComponent on: aCanvas [

	aComponent callback: callback
]

{ #category : #initialization }
ComponentCallbackSettingCommand >> initializeSetting: aCallback [

	callback := aCallback
]
