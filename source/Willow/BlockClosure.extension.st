Extension { #name : #BlockClosure }

{ #category : #'*Willow' }
BlockClosure >> asTableRowCommand [

	^ self asWebComponentCommand asTableRowCommand
]

{ #category : #'*Willow' }
BlockClosure >> asWebComponentCommand [

	^ (self cull: WebComponentCommandBuilder new cull: Willow constants) ifNil: [ CompositeComponentCommand empty ]
]
