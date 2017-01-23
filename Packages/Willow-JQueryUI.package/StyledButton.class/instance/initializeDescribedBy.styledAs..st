initialize-release
initializeDescribedBy: aDescription styledAs: aCssStyle

	commandsToComponent := OrderedCollection new.
	commandsToComponent add: (ComponentTitleCommand toSet: aDescription).
	commandsToComponent
		add:
			(ComponentClassificationCommand
				toStyleWithAll:
					(OrderedCollection new
						add: aCssStyle;
						add: JQueryCssStyles uiWidgetContent;
						add: JQueryCssStyles uiCornerAll;
						yourself)).
	interactionInterpreter := WebInteractionInterpreter forClickOnComponent