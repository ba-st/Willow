Configuring
onlyWhen: aStringCondition determineBehaviorByEvaluating: aCallbackBlock with: aParameter

	self
		interpretersDo: [ :interpreter | 
			interpreter
				onlyWhen: aStringCondition
				determineBehaviorByEvaluating: aCallbackBlock
				with: aParameter ]