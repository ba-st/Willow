testing - private
shouldApplyAsynchronousCall

	^clientIndependentActions notEmpty
		or: [priorityActions notEmpty or: [modelLoadingActions notEmpty]]