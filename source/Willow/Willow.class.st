"
I'm a shared pool providing access to constants and classes defined by the lilbrary
"
Class {
	#name : #Willow,
	#superclass : #SharedPool,
	#classVars : [
		'Classes',
		'Constants'
	],
	#pools : [
		'RenoirSt'
	],
	#category : #'Willow-Frontend'
}

{ #category : #accessing }
Willow class >> classes [

	^ Classes
]

{ #category : #accessing }
Willow class >> constants [

	^ Constants
]

{ #category : #initialization }
Willow class >> initialize [

	<ignoreForCoverage>
	self initializeConstants.
	self initializeClasses
]

{ #category : #'private - initialization' }
Willow class >> initializeClasses [

	<ignoreForCoverage>
	Classes := Namespace new.
	Classes
		bind: #fadingNotification to: 'willow-fading-notification';
		bind: #loading to: 'willow-loading';
		bind: #dialogContainer to: 'willow-dialog-container';
		bind: #willow to: 'willow';
		bind: #disabledComponent to: 'willow-disabled-component'
]

{ #category : #initialization }
Willow class >> initializeConstants [

	<ignoreForCoverage>
	Constants := Namespace new.
	Constants bind: #css to: CssConstants.
	Constants bind: #willow to: Namespace new.
	(Constants >> #willow)
		bind: #callServerFunctionName to: 'callServer';
		bind: #disabledAttributeName to: 'disabled';
		bind: #handleAjaxErrorCallFunctionName to: 'handleAjaxErrorCall';
		bind: #notificationSectionName to: 'willow-notification-section';
		bind: #dialogSectionName to: 'willow-dialog-section'
]
