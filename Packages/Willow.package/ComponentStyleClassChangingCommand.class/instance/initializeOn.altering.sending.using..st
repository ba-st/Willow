initialize-release
initializeOn: aComponentProvider altering: aCssStyle sending: aTransformationMessage using: aTransformationProvider

	componentProvider := aComponentProvider.
	styleToChange := aCssStyle.
	transformationMessage := aTransformationMessage.
	transformationProvider := aTransformationProvider