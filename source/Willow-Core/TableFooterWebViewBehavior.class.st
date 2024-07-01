"
I'm an abstract class representing table footers
"
Class {
	#name : 'TableFooterWebViewBehavior',
	#superclass : 'WAPainter',
	#category : 'Willow-Core-WebViews',
	#package : 'Willow-Core',
	#tag : 'WebViews'
}

{ #category : 'support' }
TableFooterWebViewBehavior >> changeNotifiedBy: aTableWebView [

	^ self subclassResponsibility
]
