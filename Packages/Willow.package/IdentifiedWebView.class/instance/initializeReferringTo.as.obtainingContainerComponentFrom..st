initialize-release
initializeReferringTo: aView as: aName obtainingContainerComponentFrom: aContainerComponentProvider

	view := aView.
	name := aName.
	containerComponentProvider := aContainerComponentProvider.
	propertyCommands := OrderedCollection new.
	identifierHolder := UnusedHolder explainedBy: 'Identifier never requested so far'