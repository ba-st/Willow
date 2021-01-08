"
I represent a label bound to some field.
"
Class {
	#name : #LabeledWebView,
	#superclass : #WAPainter,
	#instVars : [
		'phrasingContentProvider',
		'fieldWebView',
		'commandToComponent'
	],
	#category : #'Willow-Core-WebViews'
}

{ #category : #'Instance Creation' }
LabeledWebView class >> displaying: thePhrasingContent boundTo: aFieldWebView applying: aComponentCommand [

	^ self obtainingContentFrom: [ thePhrasingContent ] boundTo: aFieldWebView applying: aComponentCommand
]

{ #category : #'Instance Creation' }
LabeledWebView class >> obtainingContentFrom: aNyladicBlock boundTo: aFieldWebView applying: aComponentCommand [

	^ self new initializeObtainingContentFrom: aNyladicBlock boundTo: aFieldWebView applying: aComponentCommand asWebComponentCommand 
]

{ #category : #accessing }
LabeledWebView >> fieldWebView [

	^fieldWebView
]

{ #category : #initialization }
LabeledWebView >> initializeObtainingContentFrom: aNyladicBlock boundTo: aFieldWebView applying: aComponentCommand [

	phrasingContentProvider := aNyladicBlock.
	fieldWebView := aFieldWebView.
	commandToComponent := aComponentCommand
]

{ #category : #'private-accessing' }
LabeledWebView >> phrasingContent [

	^ phrasingContentProvider value
]

{ #category : #rendering }
LabeledWebView >> renderContentOn: aCanvas [

	| fieldIdentifier |

	fieldIdentifier := fieldWebView identifierOn: aCanvas.
	aCanvas label
		for: fieldIdentifier;
		with: self phrasingContent applying: commandToComponent.
	aCanvas render: self fieldWebView
]
