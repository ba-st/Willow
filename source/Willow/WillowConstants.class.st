"
I provide useful constants
"
Class {
	#name : #WillowConstants,
	#superclass : #Object,
	#category : 'Willow-WebInteraction'
}

{ #category : #Accessing }
WillowConstants class >> callServerFunctionName [

	^ 'callServer'
]

{ #category : #'Accessing Well Known Ids' }
WillowConstants class >> dialogSectionName [

	^'willow-dialog-section'
]

{ #category : #Accessing }
WillowConstants class >> disabledAttributeName [

	^ 'disabled'
]

{ #category : #Accessing }
WillowConstants class >> handleAjaxErrorCallFunctionName [

	^ 'handleAjaxErrorCall'
]

{ #category : #'Accessing Well Known Ids' }
WillowConstants class >> notificationSectionName [
	^ 'willow-notification-section'
]
