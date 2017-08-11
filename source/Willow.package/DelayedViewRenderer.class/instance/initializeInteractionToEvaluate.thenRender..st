initialization
initializeInteractionToEvaluate: aBlock thenRender: aView

	interaction := WebComponentInteraction triggeredOnClick.
	interaction
		onTriggerExecute:
			(DelayedCommand
				withBehaviorDeterminedBy: [ :response | 
					aBlock value.
					self setCurrentViewTo: aView ]);
		onTriggerExecute: (RenderingCommand for: identifiedDelayedView)