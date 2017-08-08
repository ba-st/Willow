rendering
renderContentOn: aCanvas

	aCanvas render: identifiedDelayedView.
	"This is way too hacky, but for now is the way to go"
	interaction prepareActions.
	aCanvas document addLoadScript: (interaction commandToExecuteOn: aCanvas)