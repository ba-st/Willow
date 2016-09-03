initialize-release
initializeForComponentBuiltUsing: aComponentBuilder named: aName containing: aView

	view := aView.
	name := aName.
	componentBuilder := aComponentBuilder.
	propertyCommands := OrderedCollection new.
	identifierHolder := UnusedHolder explainedBy: 'Identifier never requested so far'