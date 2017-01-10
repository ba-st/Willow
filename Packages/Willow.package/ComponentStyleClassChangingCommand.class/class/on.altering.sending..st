instance creation
on: aComponentProvider altering: aCssClass sending: aTransformationMessage

	^ self
		on: aComponentProvider
		altering: aCssClass
		sending: aTransformationMessage
		using: [ :component | component ]