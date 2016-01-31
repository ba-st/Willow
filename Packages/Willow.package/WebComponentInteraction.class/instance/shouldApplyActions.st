testing - private
shouldApplyActions

	^serverIndependentActions notEmpty or: [self shouldApplyAsynchronousCall]