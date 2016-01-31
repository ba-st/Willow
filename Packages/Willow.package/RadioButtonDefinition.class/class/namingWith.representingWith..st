instance creation
namingWith: aNamingCommand representingWith: anIconStyleNameProvider

	^self namingWith: aNamingCommand
		applying: (self imageButtonCommandUsing: anIconStyleNameProvider)