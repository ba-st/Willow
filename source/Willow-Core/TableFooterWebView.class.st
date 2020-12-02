"
I represent a table footer
"
Class {
	#name : #TableFooterWebView,
	#superclass : #TableFooterWebViewBehavior,
	#instVars : [
		'columnRenderers',
		'tableContents'
	],
	#category : #'Willow-Core-WebViews'
}

{ #category : #'Instance Creation' }
TableFooterWebView class >> definedBy: aColumnRendererCollection [

	^ self new initializeDefinedBy: aColumnRendererCollection
]

{ #category : #support }
TableFooterWebView >> changeNotifiedBy: aTableWebView [

	tableContents := aTableWebView contents
]

{ #category : #initialization }
TableFooterWebView >> initializeDefinedBy: aColumnRendererCollection [

	columnRenderers := aColumnRendererCollection.
	tableContents := #()
]

{ #category : #rendering }
TableFooterWebView >> renderContentOn: aCanvas [

	aCanvas tableFoot: [ columnRenderers do: [ :renderer | renderer renderFooterCellSummarizing: tableContents on: aCanvas ] ]
]
