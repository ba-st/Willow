initialize-release
initializeOn: aComponentProvider altering: aCssStyle sending: aTransformationMessage using: aTransformationProvider

	componentProvider := aComponentProvider.
	styleToToggle := aCssStyle.
	transformationMessage := aTransformationMessage.
	transformationProvider := aTransformationProvider