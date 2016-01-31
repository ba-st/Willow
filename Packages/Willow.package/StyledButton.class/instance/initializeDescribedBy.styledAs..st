initialize-release
initializeDescribedBy: aDescription styledAs: aCssStyle

	commandsToComponent := OrderedCollection new.
	commandsToComponent add: (self class titleCommandUsing: [aDescription]).
	commandsToComponent
		add: (self class multipleStyleCommandUsing: 
					[(OrderedCollection new)
						add: aCssStyle;
						add: JQueryCssStyles uiWidgetContent;
						add: JQueryCssStyles uiCornerAll;
						yourself]).
	interactionInterpreter := WebInteractionInterpreter forClickOnComponent