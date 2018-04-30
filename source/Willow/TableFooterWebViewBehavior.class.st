"
I'm an abstract class representing table footers
"
Class {
	#name : #TableFooterWebViewBehavior,
	#superclass : #WAPainter,
	#category : #'Willow-WebViews'
}

{ #category : #support }
TableFooterWebViewBehavior >> changeNotifiedBy: aTableWebView [

	^ self subclassResponsibility
]
