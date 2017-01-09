configuring
evaluate: aCallbackBlock
	handling: anException
	byExecuting: aHandlingCallbackBlock
	andRendering: anIdentifiedView

	self
		evaluate: aCallbackBlock
		handling: anException
		byExecuting: aHandlingCallbackBlock
		andRenderingAll: (Array with: anIdentifiedView)