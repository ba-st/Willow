"
A LoadingNotificationCommandTest is a test class for testing the behavior of LoadingNotificationCommand
"
Class {
	#name : #LoadingNotificationCommandTest,
	#superclass : #BWRenderingTest,
	#category : #'Willow-Tests-WebInteraction'
}

{ #category : #'tests-accessing' }
LoadingNotificationCommandTest >> renderedContentUsingModelLoadingActionsOf: aCommand [

	^ self
		renderUsing: [ :canvas | 
			| script anchor |

			script := canvas javascript.
			anchor := canvas anchor.
			canvas ensureIdFor: anchor.

			aCommand modelLoadingActions do: [ :action | action value: script value: canvas ].
			anchor script: (canvas jQuery this onClick: script) ]
]

{ #category : #'tests-accessing' }
LoadingNotificationCommandTest >> renderedContentUsingServerIndependentActionOf: aCommand [

	^ self
		renderUsing: [ :canvas | 
			| script anchor |

			script := canvas javascript.
			aCommand serverIndependentActions do: [ :action | action value: script value: canvas ].
			anchor := canvas anchor.
			canvas ensureIdFor: anchor.
			anchor script: (canvas jQuery this onClick: script) ].
]

{ #category : #'tests-accessing' }
LoadingNotificationCommandTest >> testClientIndependentActions [

	| command |
	
	command := LoadingNotificationCommand onPageTopWithClasses: #(). 
	
	self assert: command clientIndependentActions isEmpty
]

{ #category : #'tests-accessing' }
LoadingNotificationCommandTest >> testClientIndependentActionsWithCustomView [

	| command |
	
	command := LoadingNotificationCommand displaying: [ :canvas | canvas span with: 'Processing...' ] applying: [ :div | div addClass loading ].
	
	self assert: command clientIndependentActions isEmpty
]

{ #category : #'tests-accessing' }
LoadingNotificationCommandTest >> testModelLoadingActions [

	| html command |
	
	command := LoadingNotificationCommand onPageTopWithClasses: #().

	html := self renderedContentUsingModelLoadingActionsOf: command.

	self
		assert: html
		equals: '<a id="a-id1"></a><script type="text/javascript">$("#a-id1").click(function(){$("#willow-notification-section").html("")});</script>'
]

{ #category : #'tests-accessing' }
LoadingNotificationCommandTest >> testModelLoadingActionsWithCustomView [

	| html command |
	
	command := LoadingNotificationCommand displaying: [ :canvas | canvas span with: 'Processing...' ] applying: [ :div | div addClass loading ].

	html := self renderedContentUsingModelLoadingActionsOf: command.

	self
		assert: html
		equals: '<a id="a-id1"></a><script type="text/javascript">$("#a-id1").click(function(){$("#willow-notification-section").html("")});</script>'
]

{ #category : #'tests-accessing' }
LoadingNotificationCommandTest >> testPriorityActions [

	| command |
	
	command := LoadingNotificationCommand onPageTopWithClasses: #(). 
	
	self assert: command priorityActions isEmpty
]

{ #category : #'tests-accessing' }
LoadingNotificationCommandTest >> testPriorityActionsWithCustomView [

	| command |
	
	command := LoadingNotificationCommand displaying: [ :canvas | canvas span with: 'Processing...' ] applying: [ :div | div addClass loading ].
	
	self assert: command priorityActions isEmpty
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
	
	command := LoadingNotificationCommand displaying: [ :canvas | canvas span with: 'Processing...' ] applying: [ :div | div addClass loading ].
	
	self deny: command requiresSerialization
]

{ #category : #'tests-accessing' }
LoadingNotificationCommandTest >> testServerIndependentActions [

	| html command |
	
	command := LoadingNotificationCommand onPageTopWithClasses: #('loading').

	html := self renderedContentUsingServerIndependentActionOf: command.

	self
		assert: html
		equals:
			'<a id="a-id1"></a><script type="text/javascript">$("#a-id1").click(function(){$("#willow-notification-section").html("<div class=\"loading\">Loading...</div>")});</script>'
]

{ #category : #'tests-accessing' }
LoadingNotificationCommandTest >> testServerIndependentActionsWithCustomVIew [

	| html command |
	
	command := LoadingNotificationCommand displaying: [ :canvas | canvas span with: 'Processing...' ] applying: [ :div | div addClass loading ].

	html := self renderedContentUsingServerIndependentActionOf: command.

	self
		assert: html
		equals:
			'<a id="a-id1"></a><script type="text/javascript">$("#a-id1").click(function(){$("#willow-notification-section").html("<div class=\"willow-loading\"><span>Processing...</span></div>")});</script>'
]
