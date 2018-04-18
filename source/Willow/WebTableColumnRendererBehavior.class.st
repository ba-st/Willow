"
I'm an abstract class defining the required behavior for rendering columns in a table
"
Class {
	#name : #WebTableColumnRendererBehavior,
	#superclass : #Object,
	#category : 'Willow-WebViews'
}

{ #category : #rendering }
WebTableColumnRendererBehavior >> renderCellFor: anItem on: aCanvas [

	self subclassResponsibility
]

{ #category : #rendering }
WebTableColumnRendererBehavior >> renderHeadingOn: aCanvas [

	self subclassResponsibility
]
