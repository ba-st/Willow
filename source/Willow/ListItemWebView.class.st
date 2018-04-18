"
I represent a list item including command support. 
"
Class {
	#name : #ListItemWebView,
	#superclass : #WAPainter,
	#instVars : [
		'commandToComponent',
		'list',
		'item'
	],
	#category : 'Willow-WebViews'
}

{ #category : #'instance creation' }
ListItemWebView class >> itemizing: anObject containedIn: aList applying: aComponentCommand [

	^ self new initializeItemizing: anObject containedIn: aList applying: aComponentCommand asWebComponentCommand 
]

{ #category : #'initialize-release' }
ListItemWebView >> initializeItemizing: anObject containedIn: aList applying: aComponentCommand [

	item := anObject.
	list := aList.
	commandToComponent := aComponentCommand
]

{ #category : #rendering }
ListItemWebView >> renderContentOn: aCanvas [

	| component |

	component := aCanvas listItem.
	commandToComponent applyTo: component on: aCanvas.
	component with: (list labelForOption: item)
]
