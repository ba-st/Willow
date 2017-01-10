instance creation
on: aComponentProvider altering: aCssClass sending: aTransformationMessage using: aTransformationAction

	^self new
		initializeOn: aComponentProvider
		altering: aCssClass
		sending: aTransformationMessage
		using: aTransformationAction