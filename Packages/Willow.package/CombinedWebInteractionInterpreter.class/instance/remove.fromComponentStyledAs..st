configuring
remove: aCssStyle fromComponentStyledAs: aComponentByStyleName

	interpreters do: 
			[:anInterpreter |
			anInterpreter remove: aCssStyle
				fromComponentStyledAs: aComponentByStyleName]