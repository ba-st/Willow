configuring
evaluate: aCallbackBlock
	handling: anException
	byExecuting: aHandlingCallbackBlock
	andRenderingAll: anIdentifiedViewCollection

	interaction onTriggerExecute: (
		EvaluatingCommand
			for: aCallbackBlock
			handling: anException
			byExecuting: (
				Array
					with: (EvaluatingCommand for: aHandlingCallbackBlock)
					with: (RenderingCommand forAll: anIdentifiedViewCollection)))