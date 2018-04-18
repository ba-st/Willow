"
An WebTableMultiColumnRendererTest is a test class for testing the behavior of WebTableMultiColumnRenderer
"
Class {
	#name : #WebTableMultiColumnRendererTest,
	#superclass : #WARenderingTest,
	#category : 'Willow-Tests-WebViews'
}

{ #category : #tests }
WebTableMultiColumnRendererTest >> testCantCreateWithOnlyOneRenderingCommand [

	self
		should: [ WebTableMultiColumnRenderer titled: 'Title' renderingItemWithAll: (Array with: [ :item |  ]) ]
		raise: AssertionFailed
		withExceptionDo: [ :error | self assert: error messageText equals: 'Don''t use this renderer with less than two column rendering commands. Use WebTableColumnRenderer instead.' ]
]

{ #category : #tests }
WebTableMultiColumnRendererTest >> testCantCreateWithoutRenderingCommands [

	self
		should: [ WebTableMultiColumnRenderer titled: 'Title' renderingItemWithAll: #() ]
		raise: AssertionFailed
		withExceptionDo: [ :error | 
			self
				assert: error messageText
				equals: 'Don''t use this renderer with less than two column rendering commands. Use WebTableColumnRenderer instead.' ]
]
