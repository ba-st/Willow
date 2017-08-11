Configuring
onlyWhen: aStringCondition determineBehaviorByEvaluating: aCallbackBlock with: aParameter

	interaction
		onTriggerExecute:
			(DelayedCommand
				withBehaviorDeterminedBy: aCallbackBlock
				executedOnlyWhen: aStringCondition
				with: aParameter)