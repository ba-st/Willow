Instance Creation
prefixedBy: aPrefix

	AssertionChecker enforce: [ aPrefix notEmpty ] because: 'The supplied prefix cannot be empty' raising: InstanceCreationFailed.

	^ self new initializePrefixedBy: aPrefix