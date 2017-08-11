initialization
initializeInteractionToEvaluate: aBlock thenRender: aView

	interaction := WebComponentInteraction triggeredOnClick.
	interaction
		onTriggerExecute:
			(EvaluatingCommand
				for: [ aBlock value.
					self setCurrentViewTo: aView ]);
		onTriggerExecute: (RenderingCommand for: identifiedDelayedView)