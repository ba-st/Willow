"
I'm a command configuring an input field to be of an specific type
"
Class {
	#name : #InputModeCommand,
	#superclass : #WebComponentCommand,
	#instVars : [
		'type'
	],
	#category : 'Willow-Frontend'
}

{ #category : #'Instance Creation' }
InputModeCommand class >> asDate [
	
	^self settingTypeTo: 'date'
]

{ #category : #'Instance Creation' }
InputModeCommand class >> asEmail [

	^self settingTypeTo: 'email'
]

{ #category : #'Instance Creation' }
InputModeCommand class >> asNumber [
	
	^self settingTypeTo: 'number'
]

{ #category : #'Instance Creation' }
InputModeCommand class >> asPassword [

	^ self settingTypeTo: 'password'
]

{ #category : #'private-Instance Creation' }
InputModeCommand class >> settingTypeTo: aType [
	
	^ self new initializeSettingTypeTo: aType
]

{ #category : #processing }
InputModeCommand >> applyTo: aComponent on: aCanvas [

	aComponent type: type
]

{ #category : #initialization }
InputModeCommand >> initializeSettingTypeTo: aType [

	type := aType
]
