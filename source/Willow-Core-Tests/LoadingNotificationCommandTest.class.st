"
A LoadingNotificationCommandTest is a test class for testing the behavior of LoadingNotificationCommand
"
Class {
	#name : #LoadingNotificationCommandTest,
	#superclass : #BWRenderingTest,
	#category : #'Willow-Core-Tests-WebInteraction'
}

{ #category : #'tests-accessing' }
LoadingNotificationCommandTest >> renderedContentUsingPriorityActionsOf: aCommand [

	^ self
		renderUsing: [ :canvas | 
			| asynchronousCall anchor |

			asynchronousCall := canvas jQuery ajax.
			anchor := canvas anchor.
			canvas ensureIdFor: anchor.

			aCommand priorityActions do: [  :action | action value: asynchronousCall value: canvas  ].
			anchor script: ( canvas jQuery this onClick: asynchronousCall )
			]
]

{ #category : #'tests-accessing' }
LoadingNotificationCommandTest >> testModelLoadingActionsWithCustomView [

	| command |
	
	command := LoadingNotificationCommand displaying: [ :canvas | canvas span: 'Processing...' ] applying: [ :div | div addClass loading ].

	self assert: command modelLoadingInstructions isEmpty
]

{ #category : #'tests-accessing' }
LoadingNotificationCommandTest >> testModelLoadingInstructions [

	| command |
	
	command := LoadingNotificationCommand onPageTopWithClasses: #().

	self assert: command modelLoadingInstructions isEmpty
]

{ #category : #'tests-accessing' }
LoadingNotificationCommandTest >> testPriorityActions [

	| command html |
	
	command := LoadingNotificationCommand onPageTopWithClasses: #(). 
	
	html := self renderedContentUsingPriorityActionsOf: command.

	self
		assert: html
		equals: '<a id="a-id1"></a><script type="text/javascript">$("#a-id1").click(function(){$("#willow-notification-section").html("<div>Loading...</div>");$.ajax({"complete":function(){$("#willow-notification-section").html("")}})});</script>'
]

{ #category : #'tests-accessing' }
LoadingNotificationCommandTest >> testPriorityActionsWithCustomView [

	| command html |
	
	command := LoadingNotificationCommand displaying: [ :canvas | canvas span: 'Processing...' ] applying: [ :div | div addClass loading ].
	
	html := self renderedContentUsingPriorityActionsOf: command.

	self
		assert: html
		equals: '<a id="a-id1"></a><script type="text/javascript">$("#a-id1").click(function(){$("#willow-notification-section").html("<div class=\"willow-loading\"><span>Processing...</span></div>");$.ajax({"complete":function(){$("#willow-notification-section").html("")}})});</script>'
]

{ #category : #'tests-testing' }
LoadingNotificationCommandTest >> testRequiresSerialization [

	| command |
	
	command := LoadingNotificationCommand onPageTopWithClasses: #(). 
	
	self deny: command requiresSerialization
]

{ #category : #'tests-testing' }
LoadingNotificationCommandTest >> testRequiresSerializationWithCustomView [

	| command |
	
	command := LoadingNotificationCommand displaying: [ :canvas | canvas span: 'Processing...' ] applying: [ :div | div addClass loading ].
	
	self deny: command requiresSerialization
]

{ #category : #'tests-accessing' }
LoadingNotificationCommandTest >> testServerIndependentActionsWithCustomVIew [

	| command |
	
	command := LoadingNotificationCommand displaying: [ :canvas | canvas span: 'Processing...' ] applying: [ :div | div addClass loading ].

	self assert: command serverIndependentInstructions isEmpty
]

{ #category : #'tests-accessing' }
LoadingNotificationCommandTest >> testServerIndependentInstructions [

	| command |
	
	command := LoadingNotificationCommand onPageTopWithClasses: #('loading').

	self assert: command serverIndependentInstructions isEmpty
]
