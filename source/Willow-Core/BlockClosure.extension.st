Extension { #name : #BlockClosure }

{ #category : #'*Willow-Core' }
BlockClosure >> asTableRowCommand [

	^ self asWebComponentCommand asTableRowCommand
]

{ #category : #'*Willow-Core' }
BlockClosure >> asWebComponentCommand [

	^ ( self cull: WebComponentCommandBuilder new cull: Willow constants )
		ifNil: [ CompositeComponentCommand empty ]
]
