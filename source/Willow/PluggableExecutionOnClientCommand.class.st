"
I'm a WebInteractionCommand that allows for arbitrary code execution in the client
"
Class {
	#name : #PluggableExecutionOnClientCommand,
	#superclass : #WebInteractionCommand,
	#instVars : [
		'serverIndependentActions'
	],
	#category : #'Willow-WebInteraction'
}

{ #category : #'instance creation' }
PluggableExecutionOnClientCommand class >> executingAll: aServerIndependentActionCollection [

	^self new initializeExecutingAll: aServerIndependentActionCollection
]

{ #category : #'instance creation' }
PluggableExecutionOnClientCommand class >> executingOnly: aServerIndependentAction [

	^self executingAll: (Array with: aServerIndependentAction)
]

{ #category : #accessing }
PluggableExecutionOnClientCommand >> clientIndependentActions [

	^#()
]

{ #category : #'initialize-release' }
PluggableExecutionOnClientCommand >> initializeExecutingAll: aServerIndependentActionCollection [

	serverIndependentActions := aServerIndependentActionCollection
		collect: [ :actionBlock | [ :script :canvas | script << (actionBlock cull: canvas) ] ]
]

{ #category : #accessing }
PluggableExecutionOnClientCommand >> modelLoadingActions [

	^#()
]

{ #category : #accessing }
PluggableExecutionOnClientCommand >> priorityActions [

	^#()
]

{ #category : #testing }
PluggableExecutionOnClientCommand >> requiresSerialization [

	^false
]

{ #category : #accessing }
PluggableExecutionOnClientCommand >> serverIndependentActions [

	^serverIndependentActions
]
