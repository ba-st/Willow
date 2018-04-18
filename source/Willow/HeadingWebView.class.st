"
I represent a document heading
"
Class {
	#name : #HeadingWebView,
	#superclass : #WAPainter,
	#instVars : [
		'text',
		'level',
		'commandToComponent'
	],
	#category : 'Willow-WebViews'
}

{ #category : #'Instance Creation' }
HeadingWebView class >> displaying: aHeadingText withLevel: aLevel [

	^ self displaying: aHeadingText withLevel: aLevel applying: [ :container |  ]
]

{ #category : #'Instance Creation' }
HeadingWebView class >> displaying: aHeadingText withLevel: aLevel applying: aCommand [

	^self new initializeDisplaying: aHeadingText withLevel: aLevel applying: aCommand asWebComponentCommand 
]

{ #category : #initialization }
HeadingWebView >> initializeDisplaying: aHeadingText withLevel: aLevel applying: aCommand [

	text := aHeadingText.
	level := aLevel.
	commandToComponent := aCommand
]

{ #category : #rendering }
HeadingWebView >> renderContentOn: aCanvas [

	| heading |

	heading := aCanvas heading.
	commandToComponent applyTo: heading on: aCanvas.
	heading
		level: level;
		with: text
]
