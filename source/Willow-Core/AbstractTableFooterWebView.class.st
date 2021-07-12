"
I'm an abstract class representing table footers
"
Class {
	#name : #AbstractTableFooterWebView,
	#superclass : #WAPainter,
	#category : #'Willow-Core-WebViews'
}

{ #category : #testing }
AbstractTableFooterWebView class >> isAbstract [

	^ self = AbstractTableFooterWebView
]

{ #category : #support }
AbstractTableFooterWebView >> changeNotifiedBy: aTableWebView [

	^ self subclassResponsibility
]
