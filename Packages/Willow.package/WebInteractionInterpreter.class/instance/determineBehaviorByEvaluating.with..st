configuring
determineBehaviorByEvaluating: aCallbackBlock with: aParameter
	interaction onTriggerExecute: (DelayedCommand withBehaviorDeterminedBy: aCallbackBlock with: aParameter)