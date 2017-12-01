private - testing
shouldApplyActions

	^serverIndependentActions notEmpty or: [self shouldApplyAsynchronousCall]