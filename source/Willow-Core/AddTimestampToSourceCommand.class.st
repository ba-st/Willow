"
Command to append the time to the src attribute. Useful when working with images.
"
Class {
	#name : #AddTimestampToSourceCommand,
	#superclass : #WebComponentCommand,
	#category : #'Willow-Core-Frontend'
}

{ #category : #processing }
AddTimestampToSourceCommand >> applyTo: aComponent on: aCanvas [

	(aComponent attributeAt: 'src') addField: 'time' value: Time millisecondClockValue
]
