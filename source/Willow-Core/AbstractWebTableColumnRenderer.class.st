"
I'm an abstract class defining the required behavior for rendering columns in a table
"
Class {
	#name : #AbstractWebTableColumnRenderer,
	#superclass : #Object,
	#category : #'Willow-Core-WebViews'
}

{ #category : #rendering }
AbstractWebTableColumnRenderer >> renderCellAt: anIndex for: anItem on: aCanvas [

	self subclassResponsibility
]

{ #category : #rendering }
AbstractWebTableColumnRenderer >> renderFooterCellSummarizing: tableContents on: aCanvas [ 

	self subclassResponsibility
]

{ #category : #rendering }
AbstractWebTableColumnRenderer >> renderHeadingOn: aCanvas [

	self subclassResponsibility
]
