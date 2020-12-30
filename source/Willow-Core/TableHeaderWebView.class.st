"
I represent a table header
"
Class {
	#name : #TableHeaderWebView,
	#superclass : #WAPainter,
	#instVars : [
		'columnRenderers'
	],
	#category : #'Willow-Core-WebViews'
}

{ #category : #'Instance Creation' }
TableHeaderWebView class >> definedBy: aColumnRendererCollection [

	^ self new initializeDefinedBy: aColumnRendererCollection
]

{ #category : #initialization }
TableHeaderWebView >> initializeDefinedBy: aColumnRendererCollection [

	columnRenderers := aColumnRendererCollection
]

{ #category : #rendering }
TableHeaderWebView >> renderContentOn: aCanvas [

	aCanvas tableHead: [ columnRenderers do: [ :renderer | renderer renderHeadingOn: aCanvas ] ]
]
