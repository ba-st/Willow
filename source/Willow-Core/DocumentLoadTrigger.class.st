Class {
	#name : 'DocumentLoadTrigger',
	#superclass : 'TriggeringPolicy',
	#category : 'Willow-Core-WebInteraction',
	#package : 'Willow-Core',
	#tag : 'WebInteraction'
}

{ #category : 'evaluating' }
DocumentLoadTrigger >> apply: anAsynchronousCall to: aComponent on: aCanvas [

	aCanvas document addLoadScript: anAsynchronousCall
]
