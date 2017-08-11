Configuring
evaluate: aCallbackBlock with: aParameter

	self
		determineBehaviorByEvaluating: [ :response :clientParameter | aCallbackBlock value: clientParameter ]
		with: aParameter