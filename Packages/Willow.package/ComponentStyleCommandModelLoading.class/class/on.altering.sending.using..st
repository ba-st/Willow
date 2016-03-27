instance creation - private
on: aComponentProvider altering: aCssStyle sending: aTransformationMessage using: aTransformationProvider

	^self new
		initializeOn: aComponentProvider
		altering: aCssStyle
		sending: aTransformationMessage
		using: aTransformationProvider