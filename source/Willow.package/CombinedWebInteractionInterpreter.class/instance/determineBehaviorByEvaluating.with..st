configuring
determineBehaviorByEvaluating: aCallbackBlock with: aParameter

	self interpretersDo: [:interpreter |
		interpreter determineBehaviorByEvaluating: aCallbackBlock with: aParameter]