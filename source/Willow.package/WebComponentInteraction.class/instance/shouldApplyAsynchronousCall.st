private - testing
shouldApplyAsynchronousCall

	^clientIndependentActions notEmpty
		or: [priorityActions notEmpty or: [modelLoadingActions notEmpty]]