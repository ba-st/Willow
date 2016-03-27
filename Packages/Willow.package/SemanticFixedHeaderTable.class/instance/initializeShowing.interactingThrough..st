initialize-release
initializeShowing: aColumnDefinitionCollection interactingThrough: anInteractionInterpreter

	columnDefinitions := aColumnDefinitionCollection.
	interactionInterpreter := anInteractionInterpreter.
	self initializeTableBody.
	self setElementsTo: #()