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
	Constants := Namespace new.
	Classes := Namespace new.
	Classes
		bind: #fadingNotification to: 'willow-fading-notification';
		bind: #loading to: 'willow-loading';
		bind: #dialogContainer to: 'willow-dialog-container';
		bind: #willow to: 'willow';
		bind: #disabledComponent to: 'willow-disabled-component'
]
